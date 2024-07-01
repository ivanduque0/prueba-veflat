import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_veflat/cart/presentation/routes/cart_navigation.dart';
import 'package:prueba_veflat/ui/widgets/button.dart';
import 'package:prueba_veflat/ui/widgets/button_color.dart';
import 'package:prueba_veflat/utils/constants.dart';
import 'package:prueba_veflat/utils/miscellaneous.dart';
import '../../../../../ui/theme.dart';
import '../../getx/main_controller.dart';

class ProductPage extends GetWidget<MainController> {
  ProductPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundClr,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productImage(context),
              content(context),
              Padding(
                padding: const EdgeInsets.only(bottom:25.0, left:20.0, right:20.0, top:0.0),
                child: Button(
                  borderRadius: 20,
                  label: "Add to cart", 
                  onTap: (){
                    controller.addItemToCart(controller.cartItem.value);
                    Get.back();
                  },
                  color: black,
                  ),
              )
            ],
          ),
          Positioned(
            top: 60,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: primaryBackgroundClr,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back_rounded, size: 30,),
                    ),
                    onTap: (){
                      Get.back();
                    },
                  ),
                  Container(
                    child: Row(
                      children: [
                        Obx(()=> GestureDetector(
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: primaryBackgroundClr,
                              shape: BoxShape.circle,
                            ),
                            child: (controller.isfavoriteProduct(controller.character!.value.id))?Icon(FluentIcons.heart_28_filled, size: 30,):Icon(FluentIcons.heart_28_regular, size: 30,),
                          ),
                          onTap: () {
                            controller.addRemoveFromFavorites(controller.character!.value.id);
                            controller.refreshProducts();
                          },
                        ),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: primaryBackgroundClr,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(FluentIcons.arrow_upload_16_filled, size: 30,),
                          ),
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget productImage(context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      child: ClipRRect(
        child: Image.network(
          height: 250,
          controller.character!.value.image!,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: grey,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
 
  Widget content(context){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                controller.character!.value.name!,
                style: productNameTextStyle,
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "€"+(controller.character!.value.name!.length *10).toString(),
                      style: productPriceTextStyle,
                    ),
                  ),
                  SizedBox(width: 60,),
                  Icon(FluentIcons.star_12_filled, color: yelloStar, size: 23,),
                  SizedBox(width: 5,),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: '4.8', style: productPriceTextStyle.copyWith(fontWeight: FontWeight.w900, color: black, fontSize: 15)),
                          TextSpan(text: ' (2.6k+ review)', style: productPriceTextStyle.copyWith(fontWeight: FontWeight.w900, color: lighterGrey, fontSize: 15)),
                        ],
                      )),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Obx(()=> RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Size: ', style: productSubtitleTextStyle),
                    TextSpan(text: '${controller.cartItem.value.size??""}', style: productSubtitleValueTextStyle),
                  ],
                ))),
              sizes(),
              SizedBox(height: 15,),
              Obx(()=> RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Select color: ', style: productSubtitleTextStyle),
                    TextSpan(text: '${controller.cartItem.value.color!["name"]??""}', style: productSubtitleValueTextStyle),
                  ],
                ))),
              colors(),
              SizedBox(height: 15,),
              description(),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  Widget sizes(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
      itemCount: Constants.sizes.length,
      separatorBuilder: (context, index) => SizedBox(
        width: 10,
      ),
      itemBuilder:(context, index) {
        return Center(
          child: Obx(()=> Button(
              label: Constants.sizes[index], 
              textColor: controller.cartItem.value.size==Constants.sizes[index]?white:black,
              borderColor: controller.cartItem.value.size==Constants.sizes[index]?orange:grey,
              color: controller.cartItem.value.size==Constants.sizes[index]?orange:null,
              onTap: (){
                controller.updateCartItem(controller.cartItem.value.copyWith(size: Constants.sizes[index]));
              }),
          )
          // child: Text(Constants.genders[index])
        );
      }),
    );
  }

  Widget colors(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
      itemCount: Constants.colors.length,
      separatorBuilder: (context, index) => SizedBox(
        width: 0,
      ),
      itemBuilder:(context, index) {
        return Center(
          child: Obx(()=> ButtonColor(
            selected: controller.cartItem.value.color!["value"]==Constants.colors[index]["value"],
              color: Color(hexToInteger(Constants.colors[index]["value"]!)),
              onTap: (){
                controller.updateCartItem(controller.cartItem.value.copyWith(color:Constants.colors[index]));
              }),
          )
          // child: Text(Constants.genders[index])
        );
      }),
    );
  }

  Widget description(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            width: 1.0,
            color: grey
          ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Obx(()=>ExpansionPanelList(
            animationDuration: const Duration(microseconds: 1500),
            elevation: 0,
            expandedHeaderPadding: const EdgeInsets.all(0),
            expansionCallback:(panelIndex, isExpanded) {
              controller.descriptionExpanded(isExpanded);
            },
            children: [
              ExpansionPanel(
                backgroundColor: primaryBackgroundClr,
                canTapOnHeader: true,
                headerBuilder:(context, isExpanded) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      Text("Description", textAlign: TextAlign.left, style: productSubtitleTextStyle,),
                    ],
                  );
                }, 
                body: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: productSubtitleValueTextStyle.copyWith(color: darkGrey),),
                ),
                isExpanded: controller.descriptionExpanded.value
              )
            ],
          ),
        ),
      ),
    );
  }
}

