import 'package:auth_app/localization/app_localization.dart';
import 'package:auth_app/routes.dart';
import 'package:auth_app/services/auth_api.dart';
import 'package:auth_app/services/authentication.dart';
import 'package:auth_app/services/test_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'blocs/auth_bloc/bloc.dart';
import 'firebase_options.dart';
import 'localization/localization_delegate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    Provider<AuthenticationApi>(
      create: (_) => AuthenticationService(),
      child: const LoginApp(),
    ),
  );
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.select((AuthenticationApi r) => r);

    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(repository),
      child: MaterialApp(
        initialRoute: RouteGenerator.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: const [
          AppLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale.fromSubtags(languageCode: "en"),
          Locale.fromSubtags(languageCode: "it"),
        ],
        onGenerateTitle: (context) => context.localize("title"),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
