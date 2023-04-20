import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_examples/model.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  Future<LoginHandle?> login({required String email, required String password});
}

@immutable
class LoginApi implements LoginApiProtocol {
  //singleton class pattern
  // const LoginApi._();
  // static const LoginApi _loginApi = LoginApi._();
  // factory LoginApi() => _loginApi;

  @override
  Future<LoginHandle?> login(
      {required String email, required String password}) {
    return Future.delayed(const Duration(seconds: 2),
            () => email == "sdk@gmail.com" && password == "123")
        .then((isLoggedIn) => isLoggedIn ? const LoginHandle.foobar() : null);
  }
}
