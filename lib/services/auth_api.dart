///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Class's document:
///  Authentication service abstract class
abstract class AuthenticationApi {
  const AuthenticationApi();

  getFirebaseAuth();

  /// Email of the signed user
  String get email;

  Future<String?> currentUserUid();

  /// Log in with email and password
  Future<String?> signInWithEmailAndPassword(String email, String password);

  Future<String?> signUpWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}
