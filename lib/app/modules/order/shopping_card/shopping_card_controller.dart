import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_cart_service.dart';
import 'package:vakinha_burger_mobile/app/model/order.dart';
import 'package:vakinha_burger_mobile/app/model/shopping_cart_model.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/shopping_card_atributes_mixin.dart';
import 'package:vakinha_burger_mobile/app/repositories/order/order_repository.dart';

class ShoppingCardController extends GetxController
    with ShoppingCardAtributesMixin, LoaderMixin, MessagesMixin {
  final AuthService _authService;
  final ShoppingCartService _shoppingCartService;
  final OrderRepository _orderRepository;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCartService shoppingCartService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCartService = shoppingCartService,
        _orderRepository = orderRepository;

  List<ShoppingCartModel> get products => _shoppingCartService.products;
  double get totalValue => _shoppingCartService.totalValue;

  void addresOnChanged(String? value) {
    addres.value = value ?? "";
  }

  void cpfOnChanged(String? value) {
    cpf.value = value ?? "";
  }

  void addQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addAndRemoveProductInShoppingCart(
      shoppingCartModel.product,
      quantity: shoppingCartModel.quantity + 1,
    );
  }

  void subtractQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addAndRemoveProductInShoppingCart(
      shoppingCartModel.product,
      quantity: shoppingCartModel.quantity - 1,
    );
  }

  void clearCard() => _shoppingCartService.clear();

  Future<void> createOrder(GlobalKey<FormState> shopingCartFormKey) async {
    if (shopingCartFormKey.currentState?.validate() ?? false) {
      try {
        final userID = _authService.getUserId();
        final order = Order(
          userID: userID!,
          cpf: cpf.value,
          endereco: addres.value,
          items: products,
        );

        loading.toggle();
        var orderPix = await _orderRepository.createOrder(order);
        orderPix = orderPix.copyWith(totalValue: totalValue);
        Get.offAllNamed(Constants.FINISHED_ROUTE, arguments: orderPix);
        Get.back(id: Constants.NAVIGATOR_KEY);
        loading.toggle();
      } on Exception catch (e, s) {
        loading.toggle();
        log("Erro ao criar pedido", error: e, stackTrace: s);
        message(
          MessageModel(
            title: "Erro",
            message: "Erro ao criar pedido",
            type: MessageType.error,
          ),
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    loaderListner(loading);
    messagesListner(message);
  }
}
