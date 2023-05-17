import 'package:up_invest_front/app/modules/auth/credential_dto.dart';

sealed class SocialNetworkGateway {
  Future<CredentialDTO> signInWithSocialNetwork();
}

class GoogleSocialNetworkGateway implements SocialNetworkGateway {
  @override
  Future<CredentialDTO> signInWithSocialNetwork() {
    // TODO: implement signInWithSocialNetwork
    throw UnimplementedError();
  }
}

class FacebookSocialNetworkGateway implements SocialNetworkGateway {
  @override
  Future<CredentialDTO> signInWithSocialNetwork() {
    // TODO: implement signInWithSocialNetwork
    throw UnimplementedError();
  }
}
