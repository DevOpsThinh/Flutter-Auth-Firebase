import 'package:equatable/equatable.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Abstract class's document:
/// State emitted by [AuthenticationBloc] bloc
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

/// Class's document:
/// App just opened, login or register actions required
class AuthenticationInit extends AuthenticationState {
  const AuthenticationInit();
}

/// Class's document:
/// Loading (awaiting for registration or authentication)
class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

/// Class's document:
/// Login made with success
class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();
}

/// Class's document:
/// Logged Out
class AuthenticationRevoked extends AuthenticationState {
  const AuthenticationRevoked();
}
