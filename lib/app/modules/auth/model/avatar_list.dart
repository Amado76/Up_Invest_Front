import 'avatar_model.dart';

class AvatarList {
  final Map<int, AvatarModel> _avatarList;

  AvatarList()
      : _avatarList = {
          1: const StandardAvatar(
              id: 1,
              path: 'assets/avatars/kitty.png',
              url: 'https://i.ibb.co/m6NHwyd/kitty.png'),
          2: const StandardAvatar(
              id: 2,
              path: 'assets/avatars/dog.png',
              url: 'https://i.ibb.co/XXP0Kd5/dog.png'),
          3: const StandardAvatar(
              id: 3,
              path: 'assets/avatars/man.png',
              url: 'https://i.ibb.co/YWLh289/man.png'),
          4: const StandardAvatar(
              id: 4,
              path: 'assets/avatars/unicorn.png',
              url: 'https://i.ibb.co/WtxRv1F/unicorn.png'),
          5: const StandardAvatar(
              id: 5,
              path: 'assets/avatars/woman.png',
              url: 'https://i.ibb.co/mBPMysL/woman.png'),
          6: const StandardAvatar(
              id: 6,
              path: 'assets/avatars/crocodile.png',
              url: 'https://i.ibb.co/1Q0jJMC/crocodile.png'),
          7: const StandardAvatar(
              id: 7,
              path: 'assets/avatars/fox.png',
              url: 'https://i.ibb.co/prV9mQ0/fox.png'),
          8: const StandardAvatar(
              id: 8,
              path: 'assets/avatars/kid.png',
              url: 'https://i.ibb.co/4S6cYZS/kid.png'),
        };

  Map<int, AvatarModel> get avatars => _avatarList;

  void addNetworkAvatar(String avatarPath) {
    int id = _avatarList.length + 1;
    final networkAvatarMap = <int, AvatarModel>{
      id: NetworkAvatar(id: id, path: avatarPath, url: avatarPath)
    };
    _avatarList.addEntries(networkAvatarMap.entries);
  }

  void addCustomAvatar(String avatarPath, String avatarUrl) {
    int id = _avatarList.length + 1;
    final customAvatarMap = <int, AvatarModel>{
      id: CustomAvatar(id: id, path: avatarPath, url: avatarUrl)
    };
    _avatarList.addEntries(customAvatarMap.entries);
  }
}
