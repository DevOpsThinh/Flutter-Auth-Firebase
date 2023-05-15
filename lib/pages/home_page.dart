import 'package:flutter/material.dart';
import 'package:auth_app/pages/login_page.dart';
import 'package:auth_app/pages/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  /// Sliding animation to show the login form
  void loginTransition() {
    if (tabController.index != 1) {
      tabController.animateTo(1);
    }
  }

  /// Sliding animation to show the welcome page
  void logoutTransition() {
    if (tabController.index != 0) {
      tabController.animateTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (
        TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            LoginPage(),
            WelcomePage(),
          ],
        ));
  }
}
