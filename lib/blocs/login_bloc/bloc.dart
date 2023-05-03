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
    on<SignInButtonPressed>((event, emit){
      _loginPressed(event);
    });

    on<SignUpButtonPressed>((event, emit){
      _registerPressed(event);
    });
  }

  // void _onSignInButtonPressed(SignInButtonPressed event, Emitter<CredentialsState> emit) {
  //   emit(_loginPressed(event) as CredentialsState);
  // }
  //
  // void _onSignUpButtonPressed(SignUpButtonPressed event, Emitter<CredentialsState> emit) {
  //   emit(_registerPressed(event) as CredentialsState);
  // }

  Stream<CredentialsState> _loginPressed(CredentialsEvent event) async* {
    yield const CredentialsLoginLoading();

    try {
      final success = (await authApi.signInWithEmailAndPassword(
          event.email,
          event.password
      )) ;

      if (success != null) {
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
      final success = await authApi.signUpWithEmailAndPassword(
          event.email,
          event.password
      );

      if (success != null) {
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