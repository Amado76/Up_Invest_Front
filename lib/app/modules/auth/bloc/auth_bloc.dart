// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:up_invest_front/app/core/adapter/cache_adapter/cache_adapter.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  final ICacheAdapter cacheAdapter;
  AuthBloc({required this.cacheAdapter, required this.authRepository})
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

    authRepository.authUser.listen((user) async {
      if (user == null) {
        emit(AuthLoggedOut());
        return;
      }
      final avatar = await cacheAdapter.getSingleFile(user.avatar.url);
      emit(AuthLoggedIn(authUser: user, avatar: avatar));
    });
  }

  void _signInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      AuthUserModel authUser =
          await authRepository.signInWithEmailAndPassword(email, password);
      final avatar = await cacheAdapter.getSingleFile(authUser.avatar.url);
      emit(AuthLoggedIn(authUser: authUser, avatar: avatar));
    } on Exception catch (e) {
      emit(AuthErrorState(authError: AuthError.from(e)));
    }
  }

  void _signInWithSocialNetWork(String socialNetwork) async {
    emit(AuthLoading());
    try {
      AuthUserModel authUser =
          await authRepository.signInWithSocialNetwork(socialNetwork);
      final avatar = await cacheAdapter.getSingleFile(authUser.avatar.url);
      emit(AuthLoggedIn(authUser: authUser, avatar: avatar));
    } on Exception catch (e) {
      emit(AuthErrorState(authError: AuthError.from(e)));
    }
  }

  void _isLoggedIn() async {
    bool isLogged = await authRepository.isUserSignedIn();
    if (isLogged) {
      final authUser = await authRepository.getLoggedUser();
      final avatar = await cacheAdapter.getSingleFile(authUser.avatar.url);
      emit(AuthLoggedIn(authUser: authUser, avatar: avatar));
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
      final avatar = await cacheAdapter.getSingleFile(currentUser.avatar.url);
      emit(AuthErrorState(authError: AuthError.from(e)));
      emit(AuthLoggedIn(authUser: currentUser, avatar: avatar));
    }
  }
}
