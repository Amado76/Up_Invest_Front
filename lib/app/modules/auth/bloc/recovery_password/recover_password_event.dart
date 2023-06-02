part of 'recover_password_bloc.dart';

abstract class RecoverPasswordEvent extends Equatable {
  const RecoverPasswordEvent();
}

@immutable
final class RecoverPasswordSendEmail extends RecoverPasswordEvent {
  final String email;

  const RecoverPasswordSendEmail({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}
