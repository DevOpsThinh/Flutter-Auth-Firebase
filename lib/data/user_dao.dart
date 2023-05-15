import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Dart
/// Author: Nguyen Truong Thinh
/// Created At: 15/ 05/ 2023
///------------------------------------------------------------------

/// Class's document:
///  A [MessageDao] data access object
class UserDao extends ChangeNotifier {
  final auth = FirebaseAuth.instance;

  /// Logging In: Log back in to their account.
  Future<String?> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak!');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }

  /// Signing Up: Create an account
  Future<String?> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak!');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }
  /// Logging Out
  void logout() async {
    await auth.signOut();
    notifyListeners();
  }

  // Helper methods
  String? userID() => auth.currentUser?.uid;
  String? email() => auth.currentUser?.email;
  bool isLoggedIn() => auth.currentUser != null;
}