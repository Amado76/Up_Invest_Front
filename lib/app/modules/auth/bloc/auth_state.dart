import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';

@immutable
sealed class AuthState extends Equatable {
  final bool isLoading;
  final AuthError? authError;
  final AuthSuccess? authSuccess;

  const AuthState({required this.isLoading, this.authError, this.authSuccess});
}

@immutable
class AuthStateLoggedIn extends AuthState {
  final AuthUserModel authUser;

  const AuthStateLoggedIn(
      {required this.authUser,
      required super.isLoading,
      super.authError,
      super.authSuccess});

  @override
  List<Object?> get props =>
      [authError, super.isLoading, super.authError, super.authSuccess];
}

@immutable
class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut(
      {required super.isLoading, super.authError, super.authSuccess});
  @override
  List<Object?> get props =>
      [super.isLoading, super.authError, super.authSuccess];
}

class AuthStateSigningUp extends AuthState {
  final String avatar;
  final int index;

  const AuthStateSigningUp(
      {required this.index,
      required this.avatar,
      required super.isLoading,
      super.authError});
  @override
  List<Object?> get props =>
      [index, avatar, super.isLoading, super.authError, super.authSuccess];
}

@immutable
class AuthStateRecoverPassword extends AuthState {
  const AuthStateRecoverPassword(
      {required super.isLoading, super.authError, super.authSuccess});
  @override
  List<Object?> get props =>
      [super.isLoading, super.authError, super.authSuccess];
}

@immutable
class AuthStateIdle extends AuthState {
  const AuthStateIdle(
      {required super.isLoading, super.authError, super.authSuccess});
  @override
  List<Object?> get props =>
      [super.isLoading, super.authError, super.authSuccess];
}
