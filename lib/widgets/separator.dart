import 'package:flutter/material.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Updated At: 15/ 05/ 2023
///------------------------------------------------------------------

class Separator extends StatelessWidget {
  final double height;

  const Separator(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
