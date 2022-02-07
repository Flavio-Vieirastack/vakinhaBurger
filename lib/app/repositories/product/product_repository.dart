import 'package:vakinha_burger_mobile/app/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll();
}
