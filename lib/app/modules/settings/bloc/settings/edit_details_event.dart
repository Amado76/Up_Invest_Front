part of 'edit_details_bloc.dart';

sealed class EditDetailsEvent extends Equatable {
  const EditDetailsEvent();
}

@immutable
final class EditDetailsChangeDisplayAvatar extends EditDetailsEvent {
  final String avatarNavigation;

  const EditDetailsChangeDisplayAvatar({
    required this.avatarNavigation,
  });

  @override
  List<Object> get props => [avatarNavigation];
}

@immutable
final class EditDetailsAddAvatarFromGallery extends EditDetailsEvent {
  final String imagePath;

  const EditDetailsAddAvatarFromGallery({
    required this.imagePath,
  });

  @override
  List<Object> get props => [imagePath];
}

@immutable
final class EditDetailsUpdateAvatar extends EditDetailsEvent {
  const EditDetailsUpdateAvatar();

  @override
  List<Object?> get props => [];
}

@immutable
final class EditDetailsCleanAvatarList extends EditDetailsEvent {
  const EditDetailsCleanAvatarList();

  @override
  List<Object?> get props => [];
}

@immutable
final class EditDetailsCancelAvatarEdit extends EditDetailsEvent {
  const EditDetailsCancelAvatarEdit();

  @override
  List<Object?> get props => [];
}

@immutable
final class EditDetailsUpdateDisplayName extends EditDetailsEvent {
  final String newName;
  const EditDetailsUpdateDisplayName({required this.newName});

  @override
  List<Object?> get props => [newName];
}

@immutable
final class EditDetailsUpdatePassword extends EditDetailsEvent {
  final String password;
  final String newPassword;
  final String email;
  const EditDetailsUpdatePassword(
      {required this.password, required this.newPassword, required this.email});

  @override
  List<Object?> get props => [password, newPassword, email];
}
