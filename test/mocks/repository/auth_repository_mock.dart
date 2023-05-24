import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository_interface.dart';

class AuthRepositoryMock extends Mock implements IAuthRepository {
  @override
  final IAuthGateway authGateway;
  AuthRepositoryMock({required this.authGateway});
}
