import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/exceptions/user_not_found_exception.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_atributes_mixin.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class LoginController extends GetxController
    with LoaderMixin, MessagesMixin, LoginAtributesMixin {
  final AuthRepository _authRepository;

  LoginController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListner(loading);
    messagesListner(message);
  }

  @override
  void onClose() {
    super.onClose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  Future<void> _login({required String email, required String password}) async {
    try {
      loading.toggle();
      final userLoged =
          await _authRepository.login(email: email, passworld: password);
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLoged.id);
      loading.toggle();
    } on UserNotFoundException catch (e, s) {
      loading.toggle();
      log("Email ou senha inválidos no login", error: e, stackTrace: s);
      message(MessageModel(
          title: "Erro",
          message: "Login ou senha inválidos",
          type: MessageType.error));
    } catch (e, s) {
      loading.toggle();
      log("Erro ao realizar login", error: e, stackTrace: s);
      message(MessageModel(
          title: "Erro",
          message: "Login ou senha inválidos",
          type: MessageType.error));
    }
  }

  void validate({required String email, required String password}) {
    if (formKey.currentState?.validate() ?? false) {
      _login(email: email, password: password);
    }
  }
}
