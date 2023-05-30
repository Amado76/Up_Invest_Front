part of 'auth_bloc.dart';

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
  final AvatarModel avatarModel;

  const AuthStateSigningUp(
      {required this.avatarModel, required super.isLoading, super.authError});
  @override
  List<Object?> get props =>
      [avatarModel, super.isLoading, super.authError, super.authSuccess];
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
