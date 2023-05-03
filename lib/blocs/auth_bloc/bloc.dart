import 'package:auth_app/blocs/auth_bloc/events.dart';
import 'package:auth_app/blocs/auth_bloc/states.dart';
import 'package:auth_app/services/Authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Class's document:
/// Manages the authentication state of the app
/// [AuthenticationBloc] is managed by the  bloc library - provides automatic stream management for us.
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService authService;

  AuthenticationBloc(this.authService) : super(const AuthenticationInit()) {
    // Mapping events to theirs corresponding state based on the business logic
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationSuccess());
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationLoading());
    await authService.signOut();
    emit( const AuthenticationRevoked());

  }
}