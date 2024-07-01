import 'package:get/get.dart';
import 'package:prueba_veflat/cart/domain/repositories/api_cart_repository.dart';
import 'package:prueba_veflat/cart/domain/repositories/local_cart_repository.dart';

class CartController extends GetxController {
  final LocalCartInterface localCartInterface;
  final ApiCartInterface apiCartInterface;

  CartController({required this.localCartInterface, required this.apiCartInterface});


  @override
  void onReady() {
    super.onReady();

  }

}
