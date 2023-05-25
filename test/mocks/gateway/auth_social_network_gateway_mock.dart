import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/credential_dto.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_social_network_gateway_interface.dart';

import '../../app/modules/auth/gateway/auth_gateway_test.dart';

class AuthSocialNetworkGatewayMock extends Mock
    implements SocialNetworkGateway {
  @override
  Future<CredentialDTO> getGoogleCredential() async {
    return CredentialDTOMock();
  }
}
