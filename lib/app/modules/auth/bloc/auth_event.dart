part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

@immutable
final class AuthEventSignInWithEmailAndPassword implements AuthEvent {
  final String email;
  final String password;

  const AuthEventSignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });
}

@immutable
final class AuthEventSignInWithSocialNetwork implements AuthEvent {
  final String socialNetwork;

  const AuthEventSignInWithSocialNetwork({
    required this.socialNetwork,
  });
}

@immutable
final class AuthEventDeleteAccount implements AuthEvent {
  final String email;
  final String password;

  const AuthEventDeleteAccount({
    required this.email,
    required this.password,
  });
}

@immutable
final class AuthEventLogOut implements AuthEvent {
  const AuthEventLogOut();
}

@immutable
final class AuthEventCreateAccount implements AuthEvent {
  final String email;
  final String password;
  final String displayName;

  const AuthEventCreateAccount({
    required this.email,
    required this.password,
    required this.displayName,
  });
}

@immutable
final class AuthEventUpdatePassword implements AuthEvent {
  final String oldPassword;
  final String newPassword;

  const AuthEventUpdatePassword({
    required this.oldPassword,
    required this.newPassword,
  });
}

@immutable
final class AuthEventSendPasswordResetEmail implements AuthEvent {
  final String email;

  const AuthEventSendPasswordResetEmail({
    required this.email,
  });
}

@immutable
final class AuthEventChangeAvatar implements AuthEvent {
  final String avatarNavigation;

  const AuthEventChangeAvatar({
    required this.avatarNavigation,
  });
}

@immutable
final class AuthEventIsLoggedIn implements AuthEvent {
  const AuthEventIsLoggedIn();
}

@immutable
final class AuthEventGoToSignUpPage implements AuthEvent {
  const AuthEventGoToSignUpPage();
}

@immutable
final class AuthEventGoToSignInPage implements AuthEvent {
  const AuthEventGoToSignInPage();
}

@immutable
final class AuthEventGoToRecoverPasswordPage implements AuthEvent {
  const AuthEventGoToRecoverPasswordPage();
}
