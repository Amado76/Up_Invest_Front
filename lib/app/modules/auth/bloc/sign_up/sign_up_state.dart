part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  final AvatarModel avatar;
  final AvatarList avatarList;

  const SignUpState({required this.avatar, required this.avatarList});
}

@immutable
final class SignUpIdle extends SignUpState {
  const SignUpIdle({required super.avatar, required super.avatarList});
  @override
  List<Object> get props => [avatar, avatarList];
}

@immutable
final class SignUpLoading extends SignUpState {
  const SignUpLoading({required super.avatar, required super.avatarList});
  @override
  List<Object> get props => [avatar, avatarList];
}

@immutable
final class SignUpError extends SignUpState {
  final AuthError authError;
  const SignUpError(
      {required super.avatar,
      required super.avatarList,
      required this.authError});
  @override
  List<Object> get props => [authError, super.avatar, super.avatarList];
}
