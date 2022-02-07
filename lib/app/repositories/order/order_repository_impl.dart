import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/restClient/rest_client.dart';
import 'package:vakinha_burger_mobile/app/model/order_pix.dart';

import 'package:vakinha_burger_mobile/app/model/order.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;
  OrderRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post(
      '/order/',
      {
        'userId': order.userID,
        'cpf': order.cpf,
        'addres': order.endereco,
        'items': order.items
            .map((product) =>
                {'quantity': product.quantity, 'productId': product.product.id})
            .toList()
      },
    );
    if (result.hasError) {
      log("Erro ao realizar pedido ${result.statusCode}",
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message: "Erro ao realizar pedido");
    }

    return OrderPix.fromMap(result.body);
  }
}
