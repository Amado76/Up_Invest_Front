import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/auth/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(
          const AuthStateIdle(isLoading: false),
        ) {
    on<AuthEventSignInWithEmailAndPassword>((event, emit) async {
      emit(
        const AuthStateLoggedOut(isLoading: true),
      );
      try {
        AuthUserModel authUser =
            await signInWithEmailAndPassword(event.email, event.password);
        emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
      } on FirebaseAuthException catch (e) {
        emit(
            AuthStateLoggedOut(isLoading: false, authError: AuthError.from(e)));
      }
    });
    on<AuthEventIsLogged>((event, emit) async {
      bool isLogged = await authRepository.isUserSignedIn();
      if (isLogged) {
        final authUser = await authRepository.getLoggedUser();
        emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
      }
      if (!isLogged) {
        emit(const AuthStateLoggedOut(isLoading: false));
      }
    });

    on<AuthEventLogOut>((event, emit) async {
      await authRepository.signOut();
      emit(const AuthStateLoggedOut(isLoading: false));
    });
  }

  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password) async {
    final authUser =
        await authRepository.signInWithEmailAndPassword(email, password);
    return authUser;
  }
}
