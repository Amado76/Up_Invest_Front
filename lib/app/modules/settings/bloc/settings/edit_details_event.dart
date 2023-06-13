part of 'edit_details_bloc.dart';

sealed class EditDetailsEvent extends Equatable {
  const EditDetailsEvent();
}

@immutable
final class EditDetailsChangeAvatar extends EditDetailsEvent {
  final String avatarNavigation;

  const EditDetailsChangeAvatar({
    required this.avatarNavigation,
  });

  @override
  List<Object> get props => [avatarNavigation];
}

@immutable
final class EditDetailsUploadPhoto extends EditDetailsEvent {
  final String imagePath;

  const EditDetailsUploadPhoto({
    required this.imagePath,
  });

  @override
  List<Object> get props => [imagePath];
}

@immutable
final class EditDetailsAddToAvatarList extends EditDetailsEvent {
  final String imagePath;

  const EditDetailsAddToAvatarList({
    required this.imagePath,
  });

  @override
  List<Object> get props => [imagePath];
}
