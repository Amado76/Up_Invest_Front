import 'dart:async';

import 'package:flutter/material.dart' show visibleForTesting;
import 'package:up_invest_front/app/core/adapter/remote_storage/remote_storage_adapter.dart';
import 'package:up_invest_front/app/modules/auth/adapter/auth_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/adapter/auth_social_network_adapter_interface.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

import '../util/credential_dto.dart';

sealed class IAuthRepository {
  final IAuthAdapter authAdapter;

  final IAuthSocialNetworkAdapter authSocialNetworkAdapter;

  final IRemoteStorageAdapter remoteStorageAdapter;

  IAuthRepository(
      {required this.authSocialNetworkAdapter,
      required this.authAdapter,
      required this.remoteStorageAdapter});

  void addAuthUserToStream(AuthUserModel? authUserModel);
  Stream<AuthUserModel?> get authUser;
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password);

  Future<AuthUserModel> signInWithSocialNetwork(String socialNetwork);
  Future<AuthUserModel> createAccount({
    required String email,
    required String password,
  });

  Future<void> updatePassword({required String newPassword});
  Future<AuthUserModel> updateAccountDetails({String? newName, String? avatar});
  Future<void> deleteUser();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
  Future<bool> isUserSignedIn();
  Future<AuthUserModel> getLoggedUser();
  Future<void> reauthenticateAUser(String email, String password);
  Future<void> deleteAllData({required AuthUserModel authUser});
}

class AuthRepository extends IAuthRepository {
  AuthRepository(
      {required super.authSocialNetworkAdapter,
      required super.authAdapter,
      required super.remoteStorageAdapter});

  @override
  void addAuthUserToStream(AuthUserModel? authUserModel) =>
      controller.sink.add(authUserModel);

  @override
  Stream<AuthUserModel?> get authUser => controller.stream;

  @visibleForTesting
  final StreamController<AuthUserModel?> controller =
      StreamController<AuthUserModel?>.broadcast();

  @override
  Future<AuthUserModel> createAccount({
    required String email,
    required String password,
  }) async {
    AuthUserModel authUser = await authAdapter.createAccount(email, password);
    return authUser;
  }

  @override
  Future<AuthUserModel> updateAccountDetails(
      {String? newName, String? avatar}) async {
    AuthUserModel authUser = await authAdapter.updateAccountDetails(
        displayName: newName, avatar: avatar);

    return authUser;
  }

  @override
  Future<void> deleteUser() async {
    authAdapter.deleteUser();
  }

  @override
  Future<void> deleteAllData({required AuthUserModel authUser}) async {
    await remoteStorageAdapter.deleteAllData(userId: authUser.userId);
  }

  @override
  Future<bool> isUserSignedIn() async {
    return await authAdapter.isUserSignedIn();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await authAdapter.sendPasswordResetEmail(email);
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword(
      String email, String password) async {
    AuthUserModel user =
        await authAdapter.signInWithEmailAndPassword(email, password);
    return user;
  }

  @override
  Future<AuthUserModel> signInWithSocialNetwork(String socialNetwork) async {
    final CredentialDTO credential;
    final AuthUserModel authUser;

    credential = await getGoogleCredential();
    authUser =
        await authAdapter.signInWithSocialNetwork(socialNetwork, credential);

    return authUser;
  }

  Future<CredentialDTO> getGoogleCredential() async {
    final CredentialDTO googleCredential;
    googleCredential = await authSocialNetworkAdapter.getCredential('google');
    return googleCredential;
  }

  @override
  Future<void> signOut() async {
    authAdapter.signOut();
  }

  @override
  @visibleForTesting
  Future<void> updatePassword({required String newPassword}) async {
    await authAdapter.updatePassword(newPassword);
  }

  @override
  Future<AuthUserModel> getLoggedUser() async {
    return await authAdapter.getLoggedUser();
  }

  @override
  Future<void> reauthenticateAUser(String email, String password) async {
    await authAdapter.reauthenticateAUser(email, password);
  }
}
