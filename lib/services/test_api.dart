import 'package:auth_app/services/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Registration and authentication mock
class TestAuthenticationApi extends AuthenticationApi {
  final String fakeEmail;
  final String fakeUid;
  final bool success;
  const TestAuthenticationApi({
    required this.fakeEmail,
    required this.fakeUid,
    required this.success,
  });

  @override
  Future<String?> currentUserUid() {
    return Future<String?>.delayed(const Duration(seconds: 1), () => fakeUid);
  }

  @override
  String get email => fakeEmail;

  @override
  FirebaseAuth getFirebaseAuth() {
    return FirebaseAuth.instance;
  }

  @override
  Future<String?> signInWithEmailAndPassword(String email, String password) {
    return Future<String?>.delayed(const Duration(seconds: 1), () => success.toString());
  }

  @override
  Future<void> signOut() => Future.delayed(const Duration(milliseconds: 200));

  @override
  Future<String?> signUpWithEmailAndPassword(String email, String password) {
    return Future<String?>.delayed(const Duration(seconds: 1), () => success.toString());
  }
}