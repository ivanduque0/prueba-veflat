import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_veflat/cart/presentation/getx/cart_controller.dart';
import 'package:prueba_veflat/main/presentation/getx/main_controller.dart';
import 'package:prueba_veflat/ui/widgets/button.dart';
import 'package:prueba_veflat/ui/widgets/input_field.dart';
import 'package:prueba_veflat/ui/widgets/normal_app_bar.dart';
import 'package:prueba_veflat/ui/widgets/product_cart.dart';
import '../../../../../ui/theme.dart';

class MyCartPage extends GetWidget<CartController> {
  MyCartPage({super.key});
  
  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundClr,
      appBar: NormalAppBar(title: "My Cart"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CartItems(context),
          calculation(),
          Padding(
            padding: const EdgeInsets.only(bottom:25.0, left:20.0, right:20.0, top:0.0),
            child: Button(
              borderRadius: 20,
              label: "Checkout", 
              onTap: (){
                mainController.cart([]);
                Get.back();
              },
              color: black,
            ),
          )
        ],
      ),
    );
  }

  CartItems(context){
    return Container(
      height: MediaQuery.of(context).size.height/2.2,
      child: Obx(()=>ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: mainController.cart.length,
          itemBuilder:(context, index) {
              return ProductCart(
                cartItem: mainController.cart[index],
                index: index
              );
          },
        ),
      ),
    ); 
  }

  calculation(){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right:20, top:10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            SizedBox(height: 10,),
            InputField(
              hint: "Apply Promo Code",
              sufixIcon: Icon(Icons.arrow_forward_ios_rounded, color: lightGrey, size: 27),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sub Total", style: leftTextCalculationStyle,),
                  Obx(()=> Text("€"+mainController.subTotal.toString(), style: rightTextCalculationStyle))
                ],
              ),
              SizedBox(height: 23,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping", style: leftTextCalculationStyle,),
                  Text("€10", style: rightTextCalculationStyle)
                ],
              ),
              SizedBox(height: 23,),
              Row(
                children: [
                  Expanded(
                          child: LayoutBuilder(
                            builder:(BuildContext context, BoxConstraints constraints) {
                              return Flex(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                direction: Axis.horizontal,
                                children: List.generate(
                                  (constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                                    width: 5, height: 3,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 216, 216, 216)
                                      )
                                    ),
                                  )
                                ),
                              );
                            },
                          )
                        ),
                ],
              ),
              SizedBox(height: 23,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: leftTextCalculationStyle,),
                  Obx(()=> Text("€"+(mainController.subTotal.value+10).toString(), style: rightTextCalculationStyle))
                ],
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}

