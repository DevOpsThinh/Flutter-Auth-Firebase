
import 'package:flutter/material.dart';
import 'package:auth_app/localization/app_localization.dart';
import 'package:auth_app/widgets/login_form.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize("title")),
      ),
      body: const Center(
        child: LoginForm()
    ),
    );
  }
}