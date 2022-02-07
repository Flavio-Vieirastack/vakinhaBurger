import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/aplication_bindings.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/routes/auth_router.dart';
import 'package:vakinha_burger_mobile/app/routes/home_router.dart';
import 'package:vakinha_burger_mobile/app/routes/orders_router.dart';
import 'package:vakinha_burger_mobile/app/routes/product_route.dart';
import 'package:vakinha_burger_mobile/app/routes/splash_router.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurgerMainApp());
}

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vakinha burger",
      theme: VakinhaUi.theme,
      initialBinding: AplicationBindings(),
      getPages: [
        ...SplashRouter.routers,
        ...AuthRouter.routers,
        ...HomeRouter.routers,
        ...ProductRouter.routers,
        ...OrdersRouter.routers,
      ],
    );
  }
}
