import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_page.dart';

class HomeRouter {
  HomeRouter._();
  static final routers = <GetPage>[
    GetPage(
      name: Constants.HOME_ROUTE,
      binding: HomeBindings(),
      page: () => const HomePage(),
    )
  ];
}
