import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/gateway/auth_social_network_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/util/credential_dto.dart';

import '../../../../mocks/auth/google_sign_in/google_sign_in_mocks.dart';

void main() async {
  late SocialNetworkGateway socialNetworkGateway;
  late CredentialDTO credentialDTO;
  WidgetsFlutterBinding.ensureInitialized();

  group('[SocialNetworkGateway]', () {
    setUp(() => socialNetworkGateway =
        SocialNetworkGateway(googleSignIn: GoogleSignInMock()));
    group('[getCredential]', () {
      setUp(() {});
      test(
          'when receive a [socialNetwork] equal to google and it is successful',
          () async => {
                //Arrange

                //Act
                credentialDTO =
                    await socialNetworkGateway.getCredential('google'),
                //Assert
                expect(credentialDTO.acessToken, 'test'),
                expect(credentialDTO.idToken, 'idToken'),
              });
      test(
          'when receive a invalid[socialNetwork] ',
          () async => {
                //Act and Assert
                expect(() => socialNetworkGateway.getCredential(''),
                    throwsException)
              });
    });
  });
}
