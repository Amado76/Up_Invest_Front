import 'package:equatable/equatable.dart';

sealed class AvatarModel extends Equatable {
  final int id;
  final String path;
  final String url;

  const AvatarModel({
    required this.id,
    required this.path,
    required this.url,
  });
}

class StandardAvatar extends AvatarModel {
  const StandardAvatar(
      {required super.id, required super.path, required super.url});
  @override
  List<Object> get props => [super.id, super.path, super.url];
}

class CustomAvatar extends AvatarModel {
  const CustomAvatar(
      {required super.id, required super.path, required super.url});
  @override
  List<Object> get props => [super.id, super.path, super.url];
}
