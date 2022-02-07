import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/restClient/rest_client.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/register/register_atributes_mixin.dart';
import 'package:vakinha_burger_mobile/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, RegisterAtributesMixin, MessagesMixin {
  final AuthRepository _authRepository;
  RegisterController({required AuthRepository authRepository})
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
    nameEC.dispose();
  }

  Future<void> _register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      loading.toggle();
      final userLogged = await _authRepository.register(
          name: name, email: email, passworld: password);
      GetStorage().write(Constants.USER_KEY, userLogged.id);
      loading.toggle();
      message(
        MessageModel(
          title: "Sucesso!",
          message: "Cadastro realizado com sucesso",
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      loading.toggle();
      log("Erro ao registar usuario", error: e, stackTrace: s);
      message(
        MessageModel(
          title: "Erro",
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      log("Erro ao realizar registro", error: e, stackTrace: s);
      message(
        MessageModel(
          title: "Erro",
          message: "Erro ao realizar registro",
          type: MessageType.error,
        ),
      );
    }
  }

  void registerValidate(
      {required String name, required String email, required String password}) {
    if (formKey.currentState?.validate() ?? false) {
      _register(name: name, email: email, password: password);
    }
  }
}
