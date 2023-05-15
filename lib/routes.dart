import 'package:flutter/material.dart';
import 'package:auth_app/pages/home_page.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Updated At: 15/ 05/ 2023
///------------------------------------------------------------------

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute<HomePage>(
          builder: (_) => const HomePage(),
        );
      default:
        throw const RouteException("Route not found");
    }
  }

  static const homePage = '/';
}

/// Exception thrown when a given route doesn't exist
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
