import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_cart_service.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_atributes_mixin.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_page.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/shopping_card_page.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/shopping_card_bindings.dart';

class HomeController extends GetxController with HomeAtributesMixin {
  final ShoppingCartService _shoppingCartService;
  HomeController({required ShoppingCartService shoppingCartService})
      : _shoppingCartService = shoppingCartService;

  //int get totalProductsInShoppingCart => _shoppingCartService.totalProducts;

  Route? onGeneratedRouter(RouteSettings settings) {
    switch (settings.name) {
      case Constants.MENU_ROUTE:
        return GetPageRoute(
          settings: settings,
          page: () => const MenuPage(),
          binding: MenuBindings(),
          transition: Transition.upToDown,
        );
      case Constants.SHOPPING_CARD_ROUTE:
        return GetPageRoute(
          settings: settings,
          page: () => const ShoppingCardPage(),
          binding: ShoppingCardBindings(),
          transition: Transition.downToUp,
        );
    }
  }

  int totalProducts() {
    return total = _shoppingCartService.totalProducts;
  }
}
