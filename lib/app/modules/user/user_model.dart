import '../auth/model/avatar_model.dart';

class UserModel {
  String name;
  AvatarModel avatar;

  UserModel({
    required this.name,
    required this.avatar,
  });
}
