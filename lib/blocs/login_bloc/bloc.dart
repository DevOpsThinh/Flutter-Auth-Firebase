import 'package:auth_app/blocs/login_bloc/states.dart';
import 'package:auth_app/services/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final AuthenticationApi authApi;
  final AuthenticationBloc authBloc;

  CredentialsBloc({
    required this.authApi,
    required this.authBloc
}) : super(const CredentialsInitial()) {
    on<SignInButtonPressed>((event, emit) => emit(_loginPressed(event)));

    on<SignUpButtonPressed>((event, emit) => emit(_registerPressed(event)));
  }

  CredentialsState _loginPressed(CredentialsEvent event) {
    const CredentialsLoginLoading();

    try {
      final success = (authApi.signInWithEmailAndPassword(
          event.email,
          event.password
      )) ;

      if (success != null) {
        authBloc.add(const LoggedIn());
        return const CredentialsInitial();
      } else {
        return const CredentialsLoginFailure();
      }
    } on FirebaseAuthException {
      return const CredentialsLoginFailure();
    }
  }

  CredentialsState _registerPressed(CredentialsEvent event) {
    const CredentialsRegisterLoading();

    try {
      final success = authApi.signUpWithEmailAndPassword(
          event.email,
          event.password
      );

      if (success != null) {
        authBloc.add(const LoggedIn());
        return const CredentialsInitial();
      } else {
        return const CredentialsRegisterFailure();
      }
    } on FirebaseAuthException {
      return const CredentialsRegisterFailure();
    }
  }
}