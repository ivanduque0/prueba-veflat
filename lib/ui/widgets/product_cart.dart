import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prueba_veflat/main/domain/entities/cart_item.dart';
import 'package:prueba_veflat/main/presentation/getx/main_controller.dart';
import 'package:prueba_veflat/ui/theme.dart';
import 'package:prueba_veflat/ui/widgets/button.dart';
import 'package:prueba_veflat/ui/widgets/button_counter.dart';
import 'package:shimmer/shimmer.dart';

class ProductCart extends StatelessWidget {
  final CartItem cartItem;
  final int index;
  
  ProductCart(
    {super.key,  
    required this.cartItem, 
    required this.index,
    }
  );

  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 190,
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: grey,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  height: 250,
                  width: 170,
                  cartItem.character!.image!,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: SizedBox(
                        width: 190.0,
                        height: 250,
                        child: Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 206, 206, 206),
                          highlightColor: Color.fromARGB(255, 152, 152, 152),
                          child:  Container(
                            decoration: BoxDecoration(
                            color: white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                          
                        ),
                      ),
                    );
                  },
                ),
              ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.character!.name!,
                      textAlign: TextAlign.start,
                      style: productNameCartTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 17,),
                    Text("Size: "+(cartItem.size).toString(),
                      textAlign: TextAlign.center,
                      style: productSubtitleValueTextStyle.copyWith(
                        color: lightGrey,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 17,),
                    Text("€"+(cartItem.price).toString(),
                      textAlign: TextAlign.center,
                      style: productNameCartTextStyle.copyWith(
                        fontSize: 20
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    counterItems(),
                    GestureDetector(
                      child: Icon(Icons.close, size: 33,),
                      onTap: (){
                        mainController.deleteItemFromCart(index);
                      },
                    )
                  ],
                ),
              )
            ],
                    ),
          )
        ],
      ),
    );
  }

  counterItems(){
    return Container(
      width: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonCounter(
            icon: Icon(Icons.remove), 
            height: 35,
            borderColor: black,
            textColor: black,
            onTap: (){
              mainController.decreaseItemQuantity(index);
            }),
          Text(cartItem.quantity.toString(), style: itemQuantityCartStyle,),
          ButtonCounter(
            icon: Icon(Icons.add), 
            height:35,
            borderColor: black,
            textColor: black,
            onTap: (){
              mainController.increaseItemQuantity(index);
            }),
        ],
      ),
    );
  }

}