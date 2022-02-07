
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/modules/order/finished/finished_binding.dart';
import 'package:vakinha_burger_mobile/app/modules/order/finished/finished_page.dart';
import 'package:vakinha_burger_mobile/app/modules/order/pix/pix_binding.dart';
import 'package:vakinha_burger_mobile/app/modules/order/pix/pix_page.dart';

class OrdersRouter {
  OrdersRouter._();
  static final routers = <GetPage>[
    GetPage(
      name: Constants.FINISHED_ROUTE,
      binding: FinishedBinding(),
      page: () => const FinishedPage(),
    ),
    GetPage(
      name: Constants.PIX_ROUTE,
      binding: PixBinding(),
      page: () => const PixPage(),
    ),
  ];
}