import 'package:auth_app/data/message_dao.dart';
import 'package:auth_app/data/user_dao.dart';
import 'package:auth_app/localization/app_localization.dart';
import 'package:auth_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'localization/localization_delegate.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Updated At: 15/ 05/ 2023
///------------------------------------------------------------------

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDao>(
          lazy: false,
          create: (_) => UserDao(),
        ),
        Provider<MessageDao>(
          lazy: false,
          create: (_) => MessageDao(),
        ),
      ],
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
          Locale.fromSubtags(languageCode: "vi"),
        ],
        onGenerateTitle: (context) => context.localize("title"),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
