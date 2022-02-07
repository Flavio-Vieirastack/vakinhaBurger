import 'package:vakinha_burger_mobile/app/model/order.dart';
import 'package:vakinha_burger_mobile/app/model/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
