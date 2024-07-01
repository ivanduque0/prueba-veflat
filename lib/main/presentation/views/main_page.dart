import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/main_controller.dart';
import 'screens/home_screen.dart';

class MainPage extends GetWidget<MainController> {

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
