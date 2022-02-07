import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/order/finished/finished_controller.dart';

class FinishedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FinishedController());
  }
}
