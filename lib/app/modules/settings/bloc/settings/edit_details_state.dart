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
  final AuthError authError;
  const EditDetailsError(
      {required super.avatar,
      required super.avatarList,
      required super.authUser,
      required this.authError});
  @override
  List<Object> get props =>
      [authError, super.avatar, super.avatarList, super.authUser];
}
