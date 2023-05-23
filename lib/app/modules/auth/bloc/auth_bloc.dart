// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/auth/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(
          const AuthStateIdle(isLoading: false),
        ) {
    on<AuthEventSignInWithEmailAndPassword>((event, emit) async {
      _signInWithEmailAndPassword(event.email, event.password);
    });
    on<AuthEventIsLoggedIn>((event, emit) async {
      _isLoggedIn();
    });

    on<AuthEventLogOut>((event, emit) async {
      _signOut();
    });
    on<AuthEventDeleteAccount>((event, emit) async {
      _deleteAccount(event.email, event.password);
    });
    on<AuthEventGoToSignUpPage>((event, emit) async {
      _goToSignUpPage;
    });
  }

  void _signInWithEmailAndPassword(String email, String password) async {
    emit(
      const AuthStateLoggedOut(isLoading: true),
    );
    try {
      AuthUserModel authUser =
          await authRepository.signInWithEmailAndPassword(email, password);
      emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateLoggedOut(isLoading: false, authError: AuthError.from(e)));
    }
  }

  void _isLoggedIn() async {
    bool isLogged = await authRepository.isUserSignedIn();
    if (isLogged) {
      final authUser = await authRepository.getLoggedUser();
      emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
    }
    if (!isLogged) {
      emit(const AuthStateLoggedOut(isLoading: false));
    }
  }

  void _signOut() async {
    await authRepository.signOut();
    emit(const AuthStateLoggedOut(isLoading: false));
  }

  void _deleteAccount(String email, String password) async {
    final currentState = state as AuthStateLoggedIn;
    final currentUser = currentState.authUser;
    emit(AuthStateLoggedIn(isLoading: true, authUser: currentUser));

    try {
      await authRepository.reauthenticateAUser(email, password);
      await authRepository.deleteUser();
      emit(const AuthStateLoggedOut(isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateLoggedIn(
          isLoading: false,
          authError: AuthError.from(e),
          authUser: currentUser));
    }
  }

  void _goToSignUpPage() async {
    final AvatarModel avatarModel = AvatarModel();
    final String avatarImage = avatarModel.avatarList[1];
    emit(AuthStateSigningUp(isLoading: false, avatarImage: avatarImage));
  }
}
