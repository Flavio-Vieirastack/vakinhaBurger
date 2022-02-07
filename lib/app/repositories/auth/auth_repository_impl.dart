import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/exceptions/user_not_found_exception.dart';
import 'package:vakinha_burger_mobile/app/core/restClient/rest_client.dart';
import 'package:vakinha_burger_mobile/app/model/user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;
  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String passworld,
  }) async {
    final result = await _restClient.post("/auth/register", {
      "name": name,
      "email": email,
      "password": passworld,
    });
    if (result.hasError) {
      var message = "Erro ao registar usuário";
      if (result.statusCode == 400) {
        message = result.body["error"];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message: message);
    }
    return login(email: email, passworld: passworld);
  }

  @override
  Future<UserModel> login(
      {required String email, required String passworld}) async {
    final result = await _restClient.post("/auth/", {
      "email": email,
      "password": passworld,
    });
    if (result.hasError) {
      if (result.statusCode == 403) {
        log("Usuário ou senha inválidos",
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }
      log("Erro ao autenticar usuário ${result.statusCode}",
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message: "Erro ao autenticar usuário");
    }
    return UserModel.fromMap(result.body);
  }
}
