import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/adapter/auth_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {
  @override
  final IAuthAdapter authAdapter;
  AuthRepositoryMock({required this.authAdapter});

  @override
  Stream<AuthUserModel?> get authUser => Stream<AuthUserModel?>.value(null);
}
