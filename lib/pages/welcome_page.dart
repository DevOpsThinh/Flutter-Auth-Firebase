import 'package:auth_app/pages/components/message_list.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/localization/app_localization.dart';
import 'package:provider/provider.dart';

import '../data/user_dao.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Updated At: 15/ 05/ 2023
///------------------------------------------------------------------

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userDao = Provider.of<UserDao>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localize("title")),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              userDao.logout();
            },
            tooltip: context.localize("logout"),
          )
        ],
      ),
      body: const Center(
        child: MessageList(),
      ),
    );
  }
}
