

import 'package:get/get.dart';
import 'package:prueba_veflat/cart/data/repositories/api_cart_impl.dart';
import 'package:prueba_veflat/cart/data/repositories/local_cart_impl.dart';
import 'package:prueba_veflat/cart/domain/repositories/api_cart_repository.dart';
import 'package:prueba_veflat/cart/domain/repositories/local_cart_repository.dart';
import 'package:prueba_veflat/cart/presentation/getx/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalCartInterface>(() => LocalCartImplementation());
    Get.lazyPut<ApiCartInterface>(() => ApiCartImplementation());
    Get.lazyPut(() => CartController(
      localCartInterface: Get.find(), 
      apiCartInterface: Get.find()
    ));
  }
}