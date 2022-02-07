import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';

class AuthService extends GetxService {
  final _isLoged = RxnBool();
  final _getStorage = GetStorage();

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      _isLoged(value != null);
    });
    ever<bool?>(_isLoged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed(Constants.LOGIN_ROUTE);
      } else {
        Get.offAllNamed(Constants.HOME_ROUTE);
      }
    });
    _isLoged(getUserId() != null);

    return this;
  }
}
