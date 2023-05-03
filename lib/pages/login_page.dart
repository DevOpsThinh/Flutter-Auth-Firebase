import 'package:flutter/material.dart';
import 'package:auth_app/blocs/authentication_bloc.dart';
import 'package:auth_app/blocs/login_bloc.dart';
import 'package:auth_app/localization/app_localization.dart';
import 'package:auth_app/services/test_api.dart';
import 'package:auth_app/widgets/login_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.select((TestAuthenticationApi u) => u);
    final authBloc = context.read<AuthenticationBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize("title")),
      ),
      body: BlocProvider<CredentialsBloc>(
        create: (context) => CredentialsBloc(
          authBloc: authBloc,
          authApi: repository,
        ),
        child: const Center(
            child: LoginForm()
        ),
      ),
    );
  }
}