import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_cart_service.dart';
import 'package:vakinha_burger_mobile/app/modules/product_detail/product_detail_atributes_mixin.dart';

class ProductDetailController extends GetxController
    with ProductDetailAtributesMixin {
  final ShoppingCartService _shoppingCartService;
  ProductDetailController({required ShoppingCartService shoppingCartService})
      : _shoppingCartService = shoppingCartService;
  @override
  void onInit() {
    super.onInit();
    totalPrice.value = product.price;
    ever<int>(quantity, (quantity) {
      totalPrice.value = product.price * quantity;
    });
    atualizationControl();
  }

  void atualizationControl() {
    final productCard = _shoppingCartService.getById(product.id);
    if (productCard != null) {
      quantity.value = productCard.quantity;
      alreadyAdd.value = true;
    }
  }

  void addProduct() {
    quantity.value += 1;
  }

  void removeProduct() {
    if (quantity > 1) {
      quantity.value -= 1;
    }
  }

  void addProductInShoppingCard() {
    _shoppingCartService.addAndRemoveProductInShoppingCart(product,
        quantity: quantity.value);
    Get.back();
  }
}
