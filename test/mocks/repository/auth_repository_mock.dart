import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {
  @override
  final IAuthGateway authGateway;
  AuthRepositoryMock({required this.authGateway});

  @override
  Future<void> signOut() async {}

  @override
  Future<void> reauthenticateAUser(String email, String password) async {}

  @override
  Future<void> deleteUser() async {}

  @override
  Future<void> sendPasswordResetEmail(String email) async {}
}

///Created to be used in tests that need to return an exception in Void methods
class AuthRepositoryMock2 extends Mock implements IAuthRepository {
  @override
  final IAuthGateway authGateway;
  AuthRepositoryMock2({required this.authGateway});
}
