// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc_examples/strings.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordTextField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      // autocorrect: false,
      obscureText: true,
      obscuringCharacter: "@",
      decoration: const InputDecoration(hintText: enterYourPasswordHere),
    );
  }
}
