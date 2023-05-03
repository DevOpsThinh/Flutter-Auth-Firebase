import 'package:auth_app/blocs/credentials_bloc//states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/Authentication.dart';
import '../auth_bloc/bloc.dart';
import '../auth_bloc/events.dart';
import 'events.dart';

///------------------------------------------------------------------
/// Topic: Flutter - Firebase's Services
/// Author: Nguyen Truong Thinh
/// Created At: 02/ 05/ 2023
///------------------------------------------------------------------

/// Class's document:
/// Manages the login state of the app
/// [CredentialsBloc] is managed by the  bloc library - provides automatic stream management for us.
class CredentialsBloc extends Bloc<CredentialsEvent, CredentialsState> {
  final AuthenticationService authService;
  final AuthenticationBloc authBloc;

  CredentialsBloc({
    required this.authBloc,
    required this.authService
}) : super(const CredentialsInitial()) {
    on <SignInButtonPressed>(_onSignInButtonPressed);
    on <SignUpButtonPressed>(_onSignUpButtonPressed);
  }

  void _onSignInButtonPressed(SignInButtonPressed event, Emitter<CredentialsState> emit) {
    emit(_loginPressed(event) as CredentialsState);
  }

  void _onSignUpButtonPressed(SignUpButtonPressed event, Emitter<CredentialsState> emit) {
    emit(_registerPressed(event) as CredentialsState);
  }

  Stream<CredentialsState> _loginPressed(CredentialsEvent event) async* {
    yield const CredentialsLoginLoading();

    try {
      final success = (await authService.signInWithEmailAndPassword(
          event.email,
          event.password
      )) ;

      if (success.isNotEmpty) {
        authBloc.add(const LoggedIn());
        yield const CredentialsInitial();
      } else {
        yield const CredentialsLoginFailure();
      }
    } on FirebaseAuthException {
      yield const CredentialsLoginFailure();
    }
  }

  Stream<CredentialsState> _registerPressed(CredentialsEvent event) async* {
    yield const CredentialsRegisterLoading();

    try {
      final success = await authService.signUpWithEmailAndPassword(
          event.email,
          event.password
      );

      if (success.isNotEmpty) {
        authBloc.add(const LoggedIn());
        yield const CredentialsInitial();
      } else {
        yield const CredentialsRegisterFailure();
      }
    } on FirebaseAuthException {
      yield const CredentialsRegisterFailure();
    }
  }

}