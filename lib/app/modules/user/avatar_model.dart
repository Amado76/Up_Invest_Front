// ignore_for_file: unnecessary_getters_setters

import 'package:equatable/equatable.dart';

class AvatarModel extends Equatable {
  final int _id;

  AvatarModel({required id}) : _id = id;

  int get id => _id;

  Map<int, String> get avatarList => _avatarMap;

  String get avatarGetUrl =>
      _avatarURLMap[_id] ?? 'https://i.ibb.co/prV9mQ0/fox.png';
  get avatarPath => _avatarMap[_id] ?? 'assets/avatars/fox.png';

  final Map<int, String> _avatarURLMap = {
    1: 'https://i.ibb.co/m6NHwyd/kitty.png',
    2: 'https://i.ibb.co/XXP0Kd5/dog.png',
    3: 'https://i.ibb.co/YWLh289/man.png',
    4: 'https://i.ibb.co/WtxRv1F/unicorn.png',
    5: 'https://i.ibb.co/mBPMysL/woman.png',
    6: 'https://i.ibb.co/1Q0jJMC/crocodile.png',
    7: 'https://i.ibb.co/prV9mQ0/fox.png',
    8: 'https://i.ibb.co/4S6cYZS/kid.png',
  };

  final Map<int, String> _avatarMap = {
    1: 'assets/avatars/kitty.png',
    2: 'assets/avatars/dog.png',
    3: 'assets/avatars/man.png',
    4: 'assets/avatars/unicorn.png',
    5: 'assets/avatars/woman.png',
    6: 'assets/avatars/crocodile.png',
    7: 'assets/avatars/fox.png',
    8: 'assets/avatars/kid.png',
  };

  @override
  List<Object?> get props => [id];
}
