part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

@immutable
class AuthEventSignInWithEmailAndPassword implements AuthEvent {
  final String email;
  final String password;

  const AuthEventSignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });
}

@immutable
class AuthEventSignInWithSocialNetwork implements AuthEvent {
  final String socialNetwork;

  const AuthEventSignInWithSocialNetwork({
    required this.socialNetwork,
  });
}

@immutable
class AuthEventDeleteAccount implements AuthEvent {
  final String email;
  final String password;

  const AuthEventDeleteAccount({
    required this.email,
    required this.password,
  });
}

@immutable
class AuthEventLogOut implements AuthEvent {
  const AuthEventLogOut();
}

@immutable
class AuthEventCreateAccount implements AuthEvent {
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
class AuthEventUpdatePassword implements AuthEvent {
  final String oldPassword;
  final String newPassword;

  const AuthEventUpdatePassword({
    required this.oldPassword,
    required this.newPassword,
  });
}

@immutable
class AuthEventUpdateAvatar implements AuthEvent {
  final String avatar;

  const AuthEventUpdateAvatar({
    required this.avatar,
  });
}

@immutable
class AuthEventUpdateDisplayName implements AuthEvent {
  final String displayName;

  const AuthEventUpdateDisplayName({
    required this.displayName,
  });
}

@immutable
class AuthEventSendPasswordResetEmail implements AuthEvent {
  final String email;

  const AuthEventSendPasswordResetEmail({
    required this.email,
  });
}

@immutable
class AuthEventChangeAvatar implements AuthEvent {
  final String avatarNavigation;

  const AuthEventChangeAvatar({
    required this.avatarNavigation,
  });
}

@immutable
class AuthEventIsLoggedIn implements AuthEvent {
  const AuthEventIsLoggedIn();
}

@immutable
class AuthEventGoToSignUpPage implements AuthEvent {
  const AuthEventGoToSignUpPage();
}

@immutable
class AuthEventGoToSignInPage implements AuthEvent {
  const AuthEventGoToSignInPage();
}

@immutable
class AuthEventGoToRecoverPasswordPage implements AuthEvent {
  const AuthEventGoToRecoverPasswordPage();
}
