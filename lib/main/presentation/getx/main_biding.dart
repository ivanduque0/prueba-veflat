

import 'package:get/get.dart';
import '../../data/repositories/api_main_impl.dart';
import '../../data/repositories/local_main_impl.dart';
import '../../domain/repositories/api_main_repository.dart';
import '../../domain/repositories/local_main_repository.dart';
import 'main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalMainInterface>(() => LocalMainImplementation());
    Get.lazyPut<ApiMainInterface>(() => ApiMainImplementation());
    Get.lazyPut(() => MainController(
      localMainInterface: Get.find(), 
      apiMainInterface: Get.find()
    ));
  }
}