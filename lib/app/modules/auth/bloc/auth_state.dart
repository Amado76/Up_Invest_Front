part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();
}

@immutable
final class AuthLoggedIn extends AuthState {
  final AuthUserModel authUser;
  final File avatar;
  const AuthLoggedIn({
    required this.avatar,
    required this.authUser,
  });
  @override
  List<Object> get props => [authUser];
}

@immutable
final class AuthLoggedOut extends AuthState {
  @override
  List<Object?> get props => [];
}

@immutable
final class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

@immutable
final class AuthSuccessState extends AuthState {
  final AuthSuccess authSucess;
  const AuthSuccessState({required this.authSucess});
  @override
  List<Object?> get props => [authSucess];
}

@immutable
final class AuthErrorState extends AuthState {
  final AuthError authError;

  const AuthErrorState({required this.authError});
  @override
  List<Object?> get props => [authError];
}

extension GetUser on AuthState {
  AuthUserModel? get authUser {
    final cls = this;
    if (cls is AuthLoggedIn) {
      return cls.authUser;
    } else {
      return null;
    }
  }
}
