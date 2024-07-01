import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prueba_veflat/cart/presentation/routes/cart_navigation.dart';
import 'package:prueba_veflat/main/presentation/getx/main_controller.dart';

import '../theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({super.key});

  @override
  final Size preferredSize = const Size.fromHeight(60.0);

  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        shape: const RoundedRectangleBorder(
        ),
        centerTitle: false,
        leading: null,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                'assets/icons/menu.svg',
                colorFilter: ColorFilter.mode(black, BlendMode.srcIn),
                semanticsLabel: 'menu',
                width: 40,
              ),
              Container(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      colorFilter: ColorFilter.mode(black, BlendMode.srcIn),
                      semanticsLabel: 'menu',
                      width: 30,
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        mainController.calculateSubTotal();
                        Get.toNamed(CartRoutes.cart);
                      },
                      child: Obx(()=> Stack(
                          children: [
                            Icon(Icons.shopping_bag_outlined, color: black, size: 30,),
                            if(mainController.cart.isNotEmpty)
                              Positioned(
                                top: 2,
                                right: 0,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: orange,
                                      borderRadius: BorderRadius.circular(60),
                                      border: Border.all(color: primaryClr, width: 2)
                                    ),
                                  width: mainController.cart.length<10?15:19,
                                  height: mainController.cart.length<10?15:19,
                                  child: Center(child: Text(mainController.cart.length.toString(), style: cartCountStyle,)),
                                  // child: Center(child: Text(mainController.cart.length.toString(), style: cartCountStyle,)),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
  );
}
