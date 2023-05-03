import 'package:equatable/equatable.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Abstract class's document:
/// Events for the [AuthenticationBloc] bloc
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// Class's document:
/// User requested to logout
class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}

/// Class's document:
/// User has logged with success
class LoggedIn extends AuthenticationEvent {
  const LoggedIn();
}
