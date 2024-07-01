import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:prueba_veflat/cart/presentation/routes/cart_navigation.dart';
import 'package:prueba_veflat/main/presentation/getx/main_controller.dart';

import '../theme.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  NormalAppBar({super.key, required this.title,});

  @override
  final Size preferredSize = const Size.fromHeight(60.0);

  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(title, style: titleAppBarTextStyle,),
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_rounded, size: 30, color: black,),
          onTap: () {
            Get.back();
          },
        ),
      );
}
