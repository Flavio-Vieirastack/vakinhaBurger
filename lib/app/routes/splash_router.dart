import 'package:get/get_navigation/get_navigation.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_binding.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_page.dart';

class SplashRouter {
  SplashRouter._();
  static final routers = <GetPage>[
    GetPage(
      name: "/",
      binding: SplashBinding(),
      page: () => const SplashPage(),
    )
  ];
}
