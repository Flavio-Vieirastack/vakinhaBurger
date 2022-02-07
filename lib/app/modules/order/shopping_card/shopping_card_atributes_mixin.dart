import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';

mixin ShoppingCardAtributesMixin on GetxController {
  final addres = "".obs;
  final cpf = "".obs;
  
  final loading = false.obs;
  final message = Rxn<MessageModel>();
}
