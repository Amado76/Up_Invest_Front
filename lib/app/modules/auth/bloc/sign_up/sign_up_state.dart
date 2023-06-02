part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  final AvatarModel avatar;
  const SignUpState({required this.avatar});
}

@immutable
final class SignUpIdle extends SignUpState {
  const SignUpIdle({required super.avatar});
  @override
  List<Object> get props => [super.avatar];
}

@immutable
final class SignUpLoading extends SignUpState {
  const SignUpLoading({required super.avatar});
  @override
  List<Object> get props => [avatar];
}

@immutable
final class SignUpError extends SignUpState {
  final AuthError authError;
  const SignUpError({required super.avatar, required this.authError});
  @override
  List<Object> get props => [authError, super.avatar];
}
