import 'package:vakinha_burger_mobile/app/model/shopping_cart_model.dart';

class Order {
  int userID;
  String cpf;
  String endereco;
  List<ShoppingCartModel> items;
  Order({
    required this.userID,
    required this.cpf,
    required this.endereco,
    required this.items,
  });
}
