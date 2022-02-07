import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';

mixin HomeAtributesMixin on GetxController {
  final _tabIndex = 0.obs;
  final _tabs = [Constants.MENU_ROUTE, Constants.SHOPPING_CARD_ROUTE];
  var total = 0;

  int get tabIndex => _tabIndex.value;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == Constants.EXIT_ROUTE) {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: Constants.NAVIGATOR_KEY);
    }
  }
}
