import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';

mixin RegisterAtributesMixin on GetxController {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final nameEC = TextEditingController();
  final passwordEC = TextEditingController();
}
