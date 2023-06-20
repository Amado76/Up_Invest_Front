part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

@immutable
final class AuthSignInWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}

@immutable
final class AuthSignInWithSocialNetwork extends AuthEvent {
  final String socialNetwork;

  const AuthSignInWithSocialNetwork({
    required this.socialNetwork,
  });
  @override
  List<Object?> get props => [socialNetwork];
}

@immutable
final class AuthDeleteAccount extends AuthEvent {
  final String email;
  final String password;

  const AuthDeleteAccount({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}

@immutable
final class AuthLogOut extends AuthEvent {
  const AuthLogOut();
  @override
  List<Object?> get props => [];
}

@immutable
final class AuthIsLoggedIn extends AuthEvent {
  const AuthIsLoggedIn();
  @override
  List<Object?> get props => [];
}

@immutable
final class AuthSendEmailVerification extends AuthEvent {
  const AuthSendEmailVerification();
  @override
  List<Object?> get props => [];
}
