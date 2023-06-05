// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(
          AuthLoggedOut(),
        ) {
    on<AuthIsLoggedIn>((event, emit) async {
      _isLoggedIn();
    });
    on<AuthLogOut>((event, emit) async {
      _signOut();
    });
    on<AuthSignInWithEmailAndPassword>((event, emit) async {
      _signInWithEmailAndPassword(event.email, event.password);
    });
    on<AuthSignInWithSocialNetwork>((event, emit) async {
      _signInWithSocialNetWork(event.socialNetwork);
    });

    on<AuthDeleteAccount>((event, emit) async {
      _deleteAccount(event.email, event.password);
    });

    on<AuthUpdatePassword>((event, emit) {
      _updatePassword(event.oldPassword, event.newPassword);
    });

    authRepository.authUser.listen((user) {
      if (user == null) {
        emit(AuthLoggedOut());
        return;
      }
      emit(AuthLoggedIn(authUser: user));
    });
  }

  void _signInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      AuthUserModel authUser =
          await authRepository.signInWithEmailAndPassword(email, password);
      emit(AuthLoggedIn(authUser: authUser));
    } on Exception catch (e) {
      emit(AuthErrorState(authError: AuthError.from(e)));
    }
  }

  void _signInWithSocialNetWork(String socialNetwork) async {
    emit(AuthLoading());
    try {
      AuthUserModel authUser =
          await authRepository.signInWithSocialNetwork(socialNetwork);
      emit(AuthLoggedIn(authUser: authUser));
    } on Exception catch (e) {
      emit(AuthErrorState(authError: AuthError.from(e)));
    }
  }

  void _isLoggedIn() async {
    bool isLogged = await authRepository.isUserSignedIn();
    if (isLogged) {
      final authUser = await authRepository.getLoggedUser();
      emit(AuthLoggedIn(
        authUser: authUser,
      ));
    }
    if (!isLogged) {
      emit(AuthLoggedOut());
    }
  }

  void _signOut() async {
    await authRepository.signOut();
    emit(AuthLoggedOut());
  }

  void _deleteAccount(String email, String password) async {
    final currentState = state as AuthLoggedIn;
    final currentUser = currentState.authUser;
    emit(AuthLoading());

    try {
      await authRepository.reauthenticateAUser(email, password);
      await authRepository.deleteUser();
      emit(AuthLoggedOut());
    } on Exception catch (e) {
      emit(AuthErrorState(authError: AuthError.from(e)));
      emit(AuthLoggedIn(authUser: currentUser));
    }
  }

  void _updatePassword(String oldPassword, String newPassword) async {
    final currentState = state as AuthLoggedIn;
    final currentUser = currentState.authUser;
    emit(AuthLoading());
    try {
      await authRepository.reauthenticateAUser(currentUser.email, oldPassword);
      await authRepository.updatePassword(newPassword: newPassword);
      emit(AuthSuccessState(authSucess: AuthSuccess.from('set-new-password')));
      emit(AuthLoggedIn(authUser: currentUser));
    } on Exception catch (e) {
      emit(AuthErrorState(authError: AuthError.from(e)));
      emit(AuthLoggedIn(authUser: currentUser));
    }
  }
}
