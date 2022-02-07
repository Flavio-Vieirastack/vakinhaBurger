import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/order/pix/pix_controller.dart';

class PixBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PixController());
  }
}
