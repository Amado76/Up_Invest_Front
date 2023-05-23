import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:up_invest_front/app/modules/auth/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

@immutable
sealed class AuthState extends Equatable {
  final bool isLoading;
  final AuthError? authError;

  const AuthState({required this.isLoading, this.authError});
}

@immutable
class AuthStateLoggedIn extends AuthState {
  final AuthUserModel authUser;

  const AuthStateLoggedIn(
      {required this.authUser, required super.isLoading, super.authError});

  @override
  List<Object?> get props => [authError, super.isLoading, super.authError];
}

@immutable
class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut({required super.isLoading, super.authError});
  @override
  List<Object?> get props => [super.isLoading, super.authError];
}

class AuthStateSigningUp extends AuthState {
  final String avatarImage;
  const AuthStateSigningUp(
      {required this.avatarImage, required super.isLoading, super.authError});
  @override
  List<Object?> get props => [avatarImage, super.isLoading, super.authError];
}

@immutable
class AuthStateIdle extends AuthState {
  const AuthStateIdle({required super.isLoading, super.authError});
  @override
  List<Object?> get props => [super.isLoading, super.authError];
}
