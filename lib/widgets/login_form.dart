import 'package:flutter/material.dart';
import 'package:auth_app/widgets/separator.dart';
import 'package:auth_app/localization/app_localization.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

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

  void loginButtonPressed(BuildContext context) {}

  void registerButtonPressed(BuildContext context) {}

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  loginButtonPressed(context);
                }
              },
              child: Text(context.localize("login")),
            ),
            const Separator(5),

            // Register
            TextButton(
                key: const Key("registerButton"),
                child: Text(context.localize("register")),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                })
          ],
        ));
      },
    );
  }
}
