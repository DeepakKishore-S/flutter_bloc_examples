// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/views/email_text_field.dart';
import 'package:flutter_bloc_examples/views/password_text_field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_bloc_examples/views/login_button.dart';

class LoginView extends HookWidget {
  final OnLogInTapped onLoginTapped;
  const LoginView({
    super.key,
    required this.onLoginTapped,
  });

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EmailTextField(emailController: emailController),
        PasswordTextField(passwordController: passwordController),
        LoginButton(
            emailController: emailController,
            passwordController: passwordController,
            onLoginTapped: onLoginTapped,)
      ],
    );
  }
}
