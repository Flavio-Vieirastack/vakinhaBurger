import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/model/product_model.dart';
import 'package:vakinha_burger_mobile/app/modules/menu/menu_atributes_mixin.dart';
import 'package:vakinha_burger_mobile/app/repositories/product/product_repository.dart';

class MenuController extends GetxController
    with MenuAtributesMixin, LoaderMixin, MessagesMixin {
  final ProductRepository _productRepository;
  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListner(loading);
    messagesListner(message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _getAllProducts();
  }

  Future<void> _getAllProducts() async {
    try {
      loading.toggle();
      final products = await _productRepository.findAll();
      menu.assignAll(products);
      loading.toggle();
    } catch (e, s) {
      loading.toggle();
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      message(
        MessageModel(
          title: "Erro",
          message: "Erro ao buscar produtos",
          type: MessageType.error,
        ),
      );
    }
  }

  Future<void> refreshPage() async {
    debouncer.run(() async => await _getAllProducts());
  }

  void goToProductDetail(ProductModel productModel) {
    Get.toNamed(Constants.PRODUCT_ROUTE, arguments: productModel);
  }
}
