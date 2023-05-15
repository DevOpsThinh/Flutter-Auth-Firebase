import 'package:auth_app/pages/components/message_list.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/localization/app_localization.dart';

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
            onPressed: () {}
          )
        ],
      ),
      body: const Center(
        child: MessageList(),
      ),
    );
  }
}