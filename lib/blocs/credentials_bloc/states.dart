import 'package:equatable/equatable.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Abstract class's document:
/// State emitted by [LoginBloc] bloc
abstract class CredentialsState extends Equatable {
  const CredentialsState();

  @override
  List<Object> get props => [];
}

/// Class's document:
/// Action required (authentication or registration)
class CredentialsInitial extends CredentialsState {
  const CredentialsInitial();
}

/// Class's document:
/// Login request awaiting for response
class CredentialsLoginLoading extends CredentialsState {
  const CredentialsLoginLoading();
}

/// Class's document:
/// Registration request awaiting for response
class CredentialsRegisterLoading extends CredentialsState {
  const CredentialsRegisterLoading();
}

/// Class's document:
/// Invalid authentication credentials
class CredentialsLoginFailure extends CredentialsState {
  const CredentialsLoginFailure();
}

/// Class's document:
/// Weak password or invalid email
class CredentialsRegisterFailure extends CredentialsState {
  const CredentialsRegisterFailure();
}
