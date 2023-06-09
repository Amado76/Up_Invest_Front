import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/adapter/auth_social_network_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/util/credential_dto.dart';

import '../../../../mocks/auth/google_sign_in/google_sign_in_mocks.dart';

void main() async {
  late SocialNetworkAdapter authSocialNetworkAdapter;
  late CredentialDTO credentialDTO;
  WidgetsFlutterBinding.ensureInitialized();

  group('[SocialNetworkAdapter]', () {
    setUp(() => authSocialNetworkAdapter =
        SocialNetworkAdapter(googleSignIn: GoogleSignInMock()));
    group('[getCredential]', () {
      setUp(() {});
      test(
          'when receive a [socialNetwork] equal to google and it is successful',
          () async => {
                //Arrange

                //Act
                credentialDTO =
                    await authSocialNetworkAdapter.getCredential('google'),
                //Assert
                expect(credentialDTO.acessToken, 'test'),
                expect(credentialDTO.idToken, 'idToken'),
              });
      test(
          'when receive a invalid[socialNetwork] ',
          () async => {
                //Act and Assert
                expect(() => authSocialNetworkAdapter.getCredential(''),
                    throwsException)
              });
    });
  });
}
