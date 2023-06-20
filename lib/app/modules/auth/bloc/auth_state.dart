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
  List<Object> get props => [authUser, avatar];
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
  final AuthSuccess authSuccess;
  const AuthSuccessState({required this.authSuccess});
  @override
  List<Object?> get props => [authSuccess];
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
