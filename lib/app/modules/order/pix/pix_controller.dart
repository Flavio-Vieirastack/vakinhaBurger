import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/model/order_pix.dart';

class PixController extends GetxController {
  OrderPix getOrder() {
    final OrderPix order = Get.arguments;
    return order;
  }

  UriData? getImageUri() {
    final qrCode = Uri.parse(getOrder().image).data;
    return qrCode;
  }

  void copyPixCode() {
    Clipboard.setData(ClipboardData(text: getOrder().code));
    Get.rawSnackbar(
      message: 'Código pix copiado',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onInit() {
    super.onInit();
    getOrder();
  }
}
