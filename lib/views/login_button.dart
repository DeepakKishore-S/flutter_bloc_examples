// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/dialog/generic_dialog.dart';

import '../strings.dart';

typedef OnLogInTapped = void Function(String email, String password);

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLogInTapped onLoginTapped;

  const LoginButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          final email = emailController.text;
          final password = passwordController.text;

          if (email.isEmpty || password.isEmpty) {
            showGenericDialog(
                context: context,
                title: emailOrPasswordEmptyDialogTitle,
                content: emailOrPasswordEmptyDescription,
                optionDialogBuilder: () => {"ok": true});
          } else {
            onLoginTapped(email, password);
          }
        },
        child: const Text(login));
  }
}
