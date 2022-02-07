import 'package:get/get_navigation/get_navigation.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_binding.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_page.dart';

class AuthRouter {
  AuthRouter._();
  static final routers = <GetPage>[
    GetPage(
      name: Constants.LOGIN_ROUTE,
      binding: LoginBinding(),
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Constants.REGISTER_ROUTE,
      page: () => const RegisterPage(),
      binding: RegisterBindings()
    ),
  ];
}
