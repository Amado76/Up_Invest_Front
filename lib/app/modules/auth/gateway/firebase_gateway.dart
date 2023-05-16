// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:up_invest_front/app/modules/auth/credential_dto.dart';

import 'package:up_invest_front/app/modules/auth/gateway/auth_gateway_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

class FireBaseGateway implements IAuthGateway {
  @override
  FirebaseAuth auth;
  FireBaseGateway({
    required this.auth,
  });

  @override

  /// Create a new account using e-mail and password
  Future<AuthUserModel> createAccount(String email, String password,
      String displayName, String avatarPicture) async {
    UserCredential userCredential;
    userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await updatePhoto(avatarPicture);
    await updateDisplayName(displayName);
    AuthUserModel authUser =
        await getUserModelFromUserCredential(userCredential);

    return authUser;
  }

  @override

  /// Sing In usigin the e-mail and password method
  Future<AuthUserModel> singInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    AuthUserModel authUserModel =
        await getUserModelFromUserCredential(userCredential);
    return authUserModel;
  }

  @override

  /// Sign in using a social network method. The gateway will select the right social network to use.
  ///
  /// Parameters:
  /// - socialNetwork: The social network to sign in with ('facebook' or 'google').
  /// - credentialDTO: The credential data required for the sign-in process.
  ///
  /// Returns: A Future that resolves to an AuthUserModel representing the signed-in user.
  Future<AuthUserModel> singInWithSocialNetwork(
      String socialNetwork, CredentialDTO credentialDTO) async {
    if (socialNetwork == 'facebook') {
      return await singInWithFacebook(credentialDTO);
    }
    return await singInWithGoogle(credentialDTO);
  }

  /// Specific rules to sing in with Facebook
  Future<AuthUserModel> singInWithFacebook(CredentialDTO credentialDTO) async {
    final OAuthCredential facebookAuthCredential;
    facebookAuthCredential =
        FacebookAuthProvider.credential(credentialDTO.acessToken);
    UserCredential userCredential =
        await auth.signInWithCredential(facebookAuthCredential);
    return getUserModelFromUserCredential(userCredential);
  }

  /// Specific rules to sing in with Google
  Future<AuthUserModel> singInWithGoogle(CredentialDTO credentialDTO) async {
    final OAuthCredential googleAuthCredential;
    googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: credentialDTO.acessToken, idToken: credentialDTO.idToken);
    UserCredential userCredential =
        await auth.signInWithCredential(googleAuthCredential);
    return getUserModelFromUserCredential(userCredential);
  }

  /// Update the username, if it doesn't return any exception, it was successful.
  @override
  Future<void> updateDisplayName(String newDisplayName) async {
    await auth.currentUser!.updateDisplayName(newDisplayName);
  }

  /// Update the Avatar Picture, if it doesn't return any exception, it was successful.
  @override
  Future<void> updatePhoto(String newAvatarPicture) async {
    await auth.currentUser!.updatePhotoURL(newAvatarPicture);
  }

  /// Delete and logout the user, this method requires a recent login for security.
  @override
  Future<void> deleteUser(String email, String password) async {
    await reauthenticateAUser(email, password);
    await auth.currentUser!.delete();
  }

  @override

  /// Listens for User modifications and communicates if there was any sign in or sign out process
  Future<bool> isUserSignedIn() async {
    bool isSignedIn = false;

    await for (User? user in auth.authStateChanges()) {
      if (user != null) {
        isSignedIn = true;
        break;
      }
    }
    return isSignedIn;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> singOut() async {
    await auth.signOut();
  }

  /// Update password, this method requires a recent login for security.
  @override
  Future<void> updatePassword(
      String oldPassword, String newPassword, String email) async {
    await reauthenticateAUser(email, oldPassword);
    await auth.currentUser?.updatePassword(newPassword);
  }

  /// Re Authenticate the user to generate a recent login
  Future<void> reauthenticateAUser(String email, String password) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await auth.currentUser?.reauthenticateWithCredential(credential);
  }

  /// Convert the UserCredential (Firebase Object) to AuthUserModel
  Future<AuthUserModel> getUserModelFromUserCredential(
          UserCredential userCredential) async =>
      AuthUserModel(
          userId: userCredential.user!.uid,
          token: await userCredential.user!.getIdToken(),
          displayName: userCredential.user!.displayName ?? '',
          avatarPicture: userCredential.user!.photoURL ?? 'default',
          signInMethod: userCredential.credential!.signInMethod,
          isEmailVerified: userCredential.user!.emailVerified);
}
