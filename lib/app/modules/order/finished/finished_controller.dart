import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';

class FinishedController extends GetxController {
  final orderPix = Get.arguments;
  void goToHomePage() {
    Get.offAndToNamed(Constants.HOME_ROUTE);
  }
}
