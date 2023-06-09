import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';
import 'package:up_invest_front/app/modules/auth/util/credential_dto.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

sealed class IAuthAdapter {
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password);

  Future<AuthUserModel> signInWithSocialNetwork(
      String socialNetwork, CredentialDTO credentialDTO);

  Future<AuthUserModel> createAccount(String email, String password);

  Future<AuthUserModel> updateAccountDetails(
      {String? displayName, String? avatar});

  Future<void> updatePassword(String newPassword);
  @visibleForTesting
  Future<void> updatePhoto(String newAvatar);
  @visibleForTesting
  Future<void> updateDisplayName(String newDisplayName);

  Future<void> deleteUser();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> signOut();

  Future<bool> isUserSignedIn();

  Future<AuthUserModel> getLoggedUser();

  Future<void> reauthenticateAUser(String email, String password);
}

class FirebaseAuthAdapter implements IAuthAdapter {
  FirebaseAuth auth;

  FirebaseAuthAdapter({
    required this.auth,
  });

  @override
  Future<AuthUserModel> createAccount(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    AuthUserModel authUser = await getLoggedUser();

    return authUser;
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    AuthUserModel authUserModel =
        await getAuthUserModelFromUser(userCredential.user);
    return authUserModel;
  }

  /// Sign in using a social network method. The adapter will select the right social network to use.
  ///
  /// Parameters:
  /// - socialNetwork: The social network to sign in with ('facebook' or 'google').
  /// - credentialDTO: The credential data required for the sign-in process.
  ///
  /// Returns: A Future that resolves to an AuthUserModel representing the signed-in user.
  @override
  Future<AuthUserModel> signInWithSocialNetwork(
      String socialNetwork, CredentialDTO credentialDTO) async {
    switch (socialNetwork) {
      case 'google':
        return await signInWithGoogle(credentialDTO);
      case 'facebook':
        return await signInWithFacebook(credentialDTO);
      default:
        throw Exception('invalid-social-network');
    }
  }

  @visibleForTesting
  Future<AuthUserModel> signInWithFacebook(CredentialDTO credentialDTO) async {
    final OAuthCredential facebookAuthCredential;
    facebookAuthCredential =
        FacebookAuthProvider.credential(credentialDTO.acessToken);
    UserCredential userCredential =
        await auth.signInWithCredential(facebookAuthCredential);
    return await getAuthUserModelFromUser(userCredential.user);
  }

  @visibleForTesting
  Future<AuthUserModel> signInWithGoogle(CredentialDTO credentialDTO) async {
    final OAuthCredential googleAuthCredential;
    googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: credentialDTO.acessToken, idToken: credentialDTO.idToken);
    UserCredential userCredential =
        await auth.signInWithCredential(googleAuthCredential);
    return await getAuthUserModelFromUser(userCredential.user);
  }

  /// Delete and logout the user, this method requires a recent login for security.
  @override
  Future<void> deleteUser() async {
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
      isSignedIn = false;
      break;
    }
    return isSignedIn;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<AuthUserModel> updateAccountDetails(
      {String? displayName, String? avatar}) async {
    if (displayName != null) {
      await updateDisplayName(displayName);
    }
    if (avatar != null) {
      await updatePhoto(avatar);
    }
    AuthUserModel authUser = await getLoggedUser();

    return authUser;
  }

  @override
  Future<void> updateDisplayName(String newDisplayName) async {
    await auth.currentUser!.updateDisplayName(newDisplayName);
  }

  @override
  Future<void> updatePhoto(String newAvatar) async {
    await auth.currentUser!.updatePhotoURL(newAvatar);
  }

  /// Update password, this method requires a recent login for security.
  @override
  Future<void> updatePassword(String newPassword) async {
    await auth.currentUser?.updatePassword(newPassword);
  }

  /// ReAuthenticate the user to generate a recent login
  @override
  Future<void> reauthenticateAUser(String email, String password) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    await auth.currentUser?.reauthenticateWithCredential(credential);
  }

  @override
  Future<AuthUserModel> getLoggedUser() async {
    AuthUserModel authUserModel;
    User? firebaseUser = auth.currentUser;
    authUserModel = await getAuthUserModelFromUser(firebaseUser);
    return authUserModel;
  }

  /// Get the AuthUserModel from a User
  @visibleForTesting
  Future<AuthUserModel> getAuthUserModelFromUser(User? user) async {
    final String url = user?.photoURL ?? 'https://i.ibb.co/XXP0Kd5/dog.png';
    AuthUserModel authUser = AuthUserModel(
        userId: user?.uid ?? '',
        email: user?.email ?? '',
        token: await user?.getIdToken() ?? '',
        displayName: user?.displayName ?? '',
        avatar: NetworkAvatar(id: null, path: url, url: url),
        signInMethod: user?.providerData[0].providerId ?? '',
        isEmailVerified: user?.emailVerified ?? false);
    return authUser;
  }
}
