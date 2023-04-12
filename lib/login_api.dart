import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc_examples/model.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  Future<LoginHandle?> login({required login, required password});
}
