part of 'edit_details_bloc.dart';

sealed class EditDetailsState extends Equatable {
  final AvatarModel avatar;
  final AvatarList avatarList;
  final AuthUserModel authUser;
  const EditDetailsState(
      {required this.avatar, required this.avatarList, required this.authUser});
}

@immutable
final class EditDetailsIdle extends EditDetailsState {
  const EditDetailsIdle(
      {required super.avatar,
      required super.avatarList,
      required super.authUser});
  @override
  List<Object> get props => [avatar, avatarList, super.authUser];
}

@immutable
final class EditDetailsLoading extends EditDetailsState {
  const EditDetailsLoading(
      {required super.avatar,
      required super.avatarList,
      required super.authUser});
  @override
  List<Object> get props => [avatar, avatarList, super.authUser];
}

@immutable
final class EditDetailsError extends EditDetailsState {
  final AuthError? authError;
  final SettingsError? settingsError;
  const EditDetailsError(
      {required super.avatar,
      required super.avatarList,
      required super.authUser,
      this.authError,
      this.settingsError});
  @override
  List<Object> get props => [super.avatar, super.avatarList, super.authUser];
}

@immutable
final class EditDetailsSuccess extends EditDetailsState {
  final SettingsSuccess settingsSuccess;
  const EditDetailsSuccess(
      {required super.avatar,
      required super.avatarList,
      required super.authUser,
      required this.settingsSuccess});
  @override
  List<Object> get props =>
      [settingsSuccess, super.avatar, super.avatarList, super.authUser];
}
