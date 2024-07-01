import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:prueba_veflat/cart/presentation/routes/cart_navigation.dart';
import 'package:prueba_veflat/main/presentation/routes/main_navigation.dart';
import 'package:prueba_veflat/ui/theme.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      initialRoute:MainRoutes.main,
      getPages: [
        MainPages.mainPageRoute,
        MainPages.productPageRoute,
        CartPages.myCartPageRoute,
      ],
    );
  }
}
