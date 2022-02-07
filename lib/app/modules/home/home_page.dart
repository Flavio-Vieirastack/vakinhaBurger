import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/icon_badge.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_app_bar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VakinhaAppBar(),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            onTap: (value) => controller.tabIndex = value,
            currentIndex: controller.tabIndex,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "Produtos",
              ),
              BottomNavigationBarItem(
                icon: IconBadge(
                  icon: Icons.shopping_cart,
                  number: controller.totalProducts(),
                ),
                label: "Carrinho",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app),
                label: "Sair",
              )
            ],
          );
        }),
        body: Navigator(
          initialRoute: Constants.MENU_ROUTE,
          key: Get.nestedKey(Constants.NAVIGATOR_KEY),
          onGenerateRoute: controller.onGeneratedRouter,
        ));
  }
}
