import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prueba_veflat/main/presentation/views/pages/product_page.dart';
import '../getx/main_biding.dart';
import '../views/main_page.dart';

class MainRoutes {
  static String main = '/';
  static String cart = '/cart';
  static String product = '/product';
}

class MainPages {
  static GetPage mainPageRoute = GetPage(name: MainRoutes.main, page: () => MainPage(), binding: MainBinding());
  static GetPage productPageRoute = GetPage(name: MainRoutes.product, page: () => ProductPage());
}
