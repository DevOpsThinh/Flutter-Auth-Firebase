import 'package:equatable/equatable.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Abstract class's document:
/// Events for the [LoginBloc] bloc
abstract class CredentialsEvent extends Equatable {
  final String email;
  final String password;

  const CredentialsEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

/// Class's document:
/// Events fired when the sign in button is tapped
class SignInButtonPressed extends CredentialsEvent {
  const SignInButtonPressed({required String email, required String password})
      : super(email, password);
}

/// Class's document:
/// Events fired when the sign up button is tapped
class SignUpButtonPressed extends CredentialsEvent {
  const SignUpButtonPressed({required String email, required String password})
      : super(email, password);
}
