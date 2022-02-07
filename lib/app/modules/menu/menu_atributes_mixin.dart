import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vakinha_burger_mobile/app/core/helpers/debouncer_helper.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/model/product_model.dart';

mixin MenuAtributesMixin on GetxController {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;
  final debouncer = DebouncerHelper(miliSeconds: 1500);
}
