import 'package:flutter/material.dart';
import 'package:auth_app/blocs/authentication_bloc.dart';
import 'package:auth_app/localization/app_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize("title")),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(const LoggedOut()),
          )
        ],
      ),
      body: Center(
        child: Text(context.localize("welcome")),
      ),
    );
  }
}