import 'package:vakinha_burger_mobile/app/model/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> register(
      {required String name, required String email, required String passworld});
  Future<UserModel> login({required String email, required String passworld});
}
