part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();
}

@immutable
final class SignUpChangeAvatar extends SignUpEvent {
  final String avatarNavigation;

  const SignUpChangeAvatar({
    required this.avatarNavigation,
  });

  @override
  List<Object> get props => [avatarNavigation];
}

@immutable
final class SignUpUploadPhoto extends SignUpEvent {
  final String imagePath;

  const SignUpUploadPhoto({
    required this.imagePath,
  });

  @override
  List<Object> get props => [imagePath];
}

@immutable
final class SignUpCreateAccount extends SignUpEvent {
  final String email;
  final String password;
  final String displayName;

  const SignUpCreateAccount({
    required this.email,
    required this.password,
    required this.displayName,
  });

  @override
  List<Object> get props => [email, password, displayName];
}
