import 'package:auth_app/data/user_dao.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/widgets/separator.dart';
import 'package:auth_app/localization/app_localization.dart';
import 'package:provider/provider.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Updated At: 15/ 05/ 2023
///------------------------------------------------------------------

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String input) {
    if ((input.length > 10) && (input.contains("@"))) {
      return null;
    } else {
      return context.localize("invalid_field");
    }
  }

  String? validatePassword(String input) {
    if (input.length > 5) {
      return null;
    } else {
      return context.localize("invalid_field");
    }
  }

  void loginButtonPressed(BuildContext context, UserDao userDao) async {
    final errorMessage =
        await userDao.login(emailController.text, passwordController.text);

    if (errorMessage != null) {
      if (!mounted) return;
      _showDialogue(context, errorMessage, 700);
    }
  }

  void registerButtonPressed(BuildContext context, UserDao userDao) async {
    final errorMessage =
        await userDao.signUp(emailController.text, passwordController.text);

    if (errorMessage != null) {
      if (!mounted) return;
      _showDialogue(context, errorMessage, 700);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showDialogue(BuildContext context, String text, int duration) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(milliseconds: duration),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);

    return LayoutBuilder(
      builder: (context, data) {
        var baseWidth = 250.0;

        // For wider screen, such as tablets
        if (data.maxWidth <= baseWidth) {
          baseWidth = data.maxWidth / 1.4;
        }

        return SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 70),

            const Separator(50),

            Form(
              key: formKey,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 20,
                children: <Widget>[
                  SizedBox(
                    width: baseWidth - 30,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: context.localize("email_account"),
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return context.localize("invalid_field");
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: baseWidth - 30,
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key),
                        hintText: context.localize("password"),
                      ),
                      autofocus: false,
                      keyboardType: TextInputType.visiblePassword,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return context.localize("invalid_field");
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),

            const Separator(25),

            // Login
            TextButton(
              key: const Key("loginButton"),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreen),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  loginButtonPressed(context, userDao);
                }
              },
              child: Text(context.localize("login")),
            ),
            const Separator(5),

            // Register
            TextButton(
              key: const Key("registerButton"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  registerButtonPressed(context, userDao);
                }
              },
              child: Text(context.localize("register")),
            )
          ],
        ));
      },
    );
  }
}
