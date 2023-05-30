// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_error.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';
import 'package:up_invest_front/app/modules/auth/util/auth_sucess.dart';
import 'package:up_invest_front/app/modules/auth/repository/auth_repository.dart';
import 'package:up_invest_front/app/modules/user/avatar_model.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository authRepository;
  AuthBloc({required this.authRepository})
      : super(
          const AuthStateIdle(isLoading: false),
        ) {
    on<AuthEventIsLoggedIn>((event, emit) async {
      _isLoggedIn();
    });
    on<AuthEventLogOut>((event, emit) async {
      _signOut();
    });
    on<AuthEventCreateAccount>((event, emit) async {
      _createNewUser(
          email: event.email,
          password: event.password,
          displayName: event.displayName);
    });
    on<AuthEventSignInWithEmailAndPassword>((event, emit) async {
      _signInWithEmailAndPassword(event.email, event.password);
    });
    on<AuthEventSignInWithSocialNetwork>((event, emit) async {
      _signInWithSocialNetWork(event.socialNetwork);
    });

    on<AuthEventDeleteAccount>((event, emit) async {
      _deleteAccount(event.email, event.password);
    });

    on<AuthEventChangeAvatar>((event, emit) {
      _changeAvatar(event.avatarNavigation);
    });

    on<AuthEventUpdatePassword>((event, emit) {
      _updatePassword(event.oldPassword, event.newPassword);
    });

    on<AuthEventSendPasswordResetEmail>((event, emit) async {
      _passwordReset(event.email);
    });
    on<AuthEventGoToRecoverPasswordPage>((event, emit) {
      _goToRecoverPasswordPage();
    });
    on<AuthEventGoToSignUpPage>((event, emit) {
      _goToSignUpPage();
    });
    on<AuthEventGoToSignInPage>((event, emit) {
      _goToSignInPage();
    });
  }

  void _signInWithEmailAndPassword(String email, String password) async {
    emit(
      const AuthStateLoggedOut(isLoading: true),
    );
    try {
      AuthUserModel authUser =
          await authRepository.signInWithEmailAndPassword(email, password);
      emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateLoggedOut(
          isLoading: false, authError: AuthError.fromFirebase(e)));
    } on Exception catch (e) {
      emit(AuthStateLoggedOut(isLoading: false, authError: AuthError.from(e)));
    }
  }

  void _signInWithSocialNetWork(String socialNetwork) async {
    emit(const AuthStateLoggedOut(isLoading: true));
    try {
      AuthUserModel authUser =
          await authRepository.signInWithSocialNetwork(socialNetwork);
      emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateLoggedOut(
          isLoading: false, authError: AuthError.fromFirebase(e)));
    } on Exception catch (e) {
      emit(AuthStateLoggedOut(isLoading: false, authError: AuthError.from(e)));
    }
  }

  void _isLoggedIn() async {
    bool isLogged = await authRepository.isUserSignedIn();
    if (isLogged) {
      final authUser = await authRepository.getLoggedUser();
      emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
    }
    if (!isLogged) {
      emit(const AuthStateLoggedOut(isLoading: false));
    }
  }

  void _createNewUser({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final currentState = state as AuthStateSigningUp;
    final avatar = currentState.avatarModel;
    emit(AuthStateSigningUp(
      avatarModel: avatar,
      isLoading: true,
    ));
    try {
      AuthUserModel authUser = await authRepository.createAccount(
          email: email,
          password: password,
          displayName: displayName,
          avatar: avatar.avatarGetUrl);
      emit(AuthStateLoggedIn(authUser: authUser, isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateSigningUp(
          avatarModel: avatar,
          isLoading: false,
          authError: AuthError.fromFirebase(e)));
    } on Exception catch (e) {
      emit(AuthStateSigningUp(
          avatarModel: avatar, isLoading: false, authError: AuthError.from(e)));
    }
  }

  void _signOut() async {
    await authRepository.signOut();
    emit(const AuthStateLoggedOut(isLoading: false));
  }

  void _deleteAccount(String email, String password) async {
    final currentState = state as AuthStateLoggedIn;
    final currentUser = currentState.authUser;
    emit(AuthStateLoggedIn(isLoading: true, authUser: currentUser));

    try {
      await authRepository.reauthenticateAUser(email, password);
      await authRepository.deleteUser();
      emit(const AuthStateLoggedOut(isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateLoggedIn(
          isLoading: false,
          authError: AuthError.fromFirebase(e),
          authUser: currentUser));
    } on Exception catch (e) {
      emit(AuthStateLoggedIn(
          isLoading: false,
          authError: AuthError.from(e),
          authUser: currentUser));
    }
  }

  void _updatePassword(String oldPassword, String newPassword) async {
    final currentState = state as AuthStateLoggedIn;
    final currentUser = currentState.authUser;
    emit(AuthStateLoggedIn(authUser: currentUser, isLoading: true));
    try {
      await authRepository.reauthenticateAUser(currentUser.email, oldPassword);
      await authRepository.updatePassword(newPassword: newPassword);
      emit(AuthStateLoggedIn(
          authUser: currentUser,
          isLoading: false,
          authSuccess: AuthSuccess.from('set-new-password')));
    } on FirebaseAuthException catch (e) {
      emit(AuthStateLoggedIn(
          authUser: currentUser,
          isLoading: false,
          authError: AuthError.fromFirebase(e)));
    } on Exception catch (e) {
      emit(AuthStateLoggedIn(
          isLoading: false,
          authError: AuthError.from(e),
          authUser: currentUser));
    }
  }

  void _passwordReset(String email) async {
    emit(const AuthStateRecoverPassword(isLoading: true));
    try {
      await authRepository.sendPasswordResetEmail(email);
      emit(AuthStateRecoverPassword(
          isLoading: false, authSuccess: AuthSuccess.from('reset-password')));
      emit(const AuthStateLoggedOut(isLoading: false));
    } on FirebaseAuthException catch (e) {
      emit(
        AuthStateRecoverPassword(
            isLoading: false, authError: AuthError.fromFirebase(e)),
      );
    }
  }

  void _changeAvatar(String avatarNavigation) {
    final currentState = state as AuthStateSigningUp;
    final currentAvatarModel = currentState.avatarModel;
    final listLength = currentAvatarModel.avatarList.length;
    final currentId = currentState.avatarModel.id;
    final newId = _selectAvatar(avatarNavigation, currentId, listLength);
    final newAvatarModel = AvatarModel(id: newId);

    emit(AuthStateSigningUp(
      avatarModel: newAvatarModel,
      isLoading: false,
    ));
  }

  int _selectAvatar(String avatarNavigation, int? currentId, int listLength) {
    int newId;
    if (currentId == null) {
      return 1;
    }
    if (currentId < listLength && avatarNavigation == 'FowardButton') {
      currentId++;
      newId = currentId;
      return newId;
    }
    if (currentId > 1 && avatarNavigation == 'BackButton') {
      currentId--;
      newId = currentId;
      return newId;
    }
    return currentId;
  }

  void _goToSignUpPage() {
    final AvatarModel avatarModel = AvatarModel(id: 1);

    emit(AuthStateSigningUp(isLoading: false, avatarModel: avatarModel));
  }

  void _goToSignInPage() {
    emit(const AuthStateLoggedOut(isLoading: false));
  }

  void _goToRecoverPasswordPage() {
    emit(const AuthStateRecoverPassword(isLoading: false));
  }
}
