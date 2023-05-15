import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

abstract class IAuthStandardRepository {
  final IAuthGateway authGateway;
  final AuthUserModel user;

  IAuthStandardRepository({required this.authGateway, required this.user});
}
