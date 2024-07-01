import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:prueba_veflat/cart/presentation/getx/cart_biding.dart';
import 'package:prueba_veflat/cart/presentation/views/pages/my_cart_page.dart';

class CartRoutes {
  static String cart = '/cart';
}

class CartPages {
  static GetPage myCartPageRoute = GetPage(name: CartRoutes.cart, page: () => MyCartPage(), binding: CartBinding());
}
