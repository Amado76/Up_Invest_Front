import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

class AuthUserModel extends Equatable {
  final String userId;
  final String email;
  final String token;
  final String displayName;
  final AvatarModel avatar;
  final String signInMethod;
  final bool isEmailVerified;

  const AuthUserModel(
      {required this.userId,
      required this.email,
      required this.token,
      required this.displayName,
      required this.avatar,
      required this.signInMethod,
      required this.isEmailVerified});

  @override
  List<Object?> get props => [
        userId,
        email,
        token,
        displayName,
        avatar,
        signInMethod,
        isEmailVerified,
      ];
}
