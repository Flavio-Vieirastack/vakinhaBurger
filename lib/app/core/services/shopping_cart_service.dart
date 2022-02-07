import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vakinha_burger_mobile/app/model/product_model.dart';
import 'package:vakinha_burger_mobile/app/model/shopping_cart_model.dart';

class ShoppingCartService extends GetxService {
  final _shoppingCart = <int, ShoppingCartModel>{}.obs;
  List<ShoppingCartModel> get products => _shoppingCart.values.toList();
  int get totalProducts => _shoppingCart.values.length;
  double get totalValue {
    return _shoppingCart.values.fold(0, (totalValue, shoppingCardModel) {
      totalValue +=
          shoppingCardModel.product.price * shoppingCardModel.quantity;
      return totalValue;
    });
  }

  ShoppingCartModel? getById(int id) => _shoppingCart[id];
  void addAndRemoveProductInShoppingCart(ProductModel product,
      {required int quantity}) {
    if (quantity == 0) {
      _shoppingCart.remove(product.id);
    } else {
      _shoppingCart.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCartModel(quantity: quantity, product: product);
      });
    }
  }

  void clear() {
    _shoppingCart.clear();
  }
}
