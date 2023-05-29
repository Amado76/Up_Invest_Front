import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {
  @override
  final IAuthGateway authGateway;
  AuthRepositoryMock({required this.authGateway});
}
