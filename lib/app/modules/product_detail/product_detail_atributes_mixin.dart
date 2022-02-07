import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/model/product_model.dart';

mixin ProductDetailAtributesMixin on GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final totalPrice = 0.0.obs;
  final quantity = 1.obs;
  ProductModel get product => _product.value;
  final alreadyAdd = false.obs;
}
