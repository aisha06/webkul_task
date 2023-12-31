import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  RxInt cartItemCount = 0.obs;

  void addToCart() {
    cartItemCount.value++;
  }
}