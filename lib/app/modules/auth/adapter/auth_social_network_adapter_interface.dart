import 'package:google_sign_in/google_sign_in.dart';
import 'package:up_invest_front/app/modules/auth/util/credential_dto.dart';

sealed class IAuthSocialNetworkAdapter {
  Future<CredentialDTO> getCredential(String socialNetwork);
}

class SocialNetworkAdapter extends IAuthSocialNetworkAdapter {
  SocialNetworkAdapter({required this.googleSignIn});
  final GoogleSignIn googleSignIn;

  @override
  Future<CredentialDTO> getCredential(String socialNetwork) async {
    switch (socialNetwork) {
      case 'google':
        return await _getGoogleCredential();

      default:
        throw Exception('invalid-social-network');
    }
  }

  Future<CredentialDTO> _getGoogleCredential() async {
    //Begin interactive sign in process
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    //obtain auth details from request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //create a new credential for user
    final CredentialDTO googleCredential = CredentialDTO(
        acessToken: googleAuth.accessToken!, idToken: googleAuth.idToken);
    return googleCredential;
  }
}
