import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/modules/product_detail/product_detail_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/product_detail/product_detail_page.dart';

class ProductRouter {
  ProductRouter._();
  static final routers = <GetPage>[
    GetPage(
      name: Constants.PRODUCT_ROUTE,
      binding: ProductDetailBindings(),
      page: () => const ProductDetailPage(),
    )
  ];
}
