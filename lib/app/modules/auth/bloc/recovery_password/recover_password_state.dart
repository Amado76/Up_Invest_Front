// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recover_password_bloc.dart';

sealed class RecoverPasswordState extends Equatable {
  const RecoverPasswordState();
}

@immutable
class RecoverPasswordIdle extends RecoverPasswordState {
  @override
  List<Object?> get props => [];
}

@immutable
class RecoverPasswordError extends RecoverPasswordState {
  final AuthError authError;
  const RecoverPasswordError({
    required this.authError,
  });
  @override
  List<Object?> get props => [authError];
}

@immutable
class RecoverPasswordLoading extends RecoverPasswordState {
  @override
  List<Object?> get props => [];
}

@immutable
class RecoverPasswordSuccess extends RecoverPasswordState {
  final AuthSuccess authSuccess;
  const RecoverPasswordSuccess({
    required this.authSuccess,
  });
  @override
  List<Object?> get props => [authSuccess];
}
