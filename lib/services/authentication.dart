import 'package:auth_app/services/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Class's document:
/// A concrete authentication service class that implements the [AuthenticationApi] abstract class
class AuthenticationService implements AuthenticationApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  @override
  String get email => _firebaseAuth.currentUser?.email ?? "***";

  @override
  Future<String?> currentUserUid() async {
    final User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return "";
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final User user = (await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password)) as User;
      return user.uid;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return "***";
    }
  }

  @override
  Future<String> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final User user = (await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password)) as User;
      return user.uid;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return "***";
    }
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();
}
