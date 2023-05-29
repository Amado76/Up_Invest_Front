class AvatarModel {
  int? id;
  AvatarModel({
    this.id,
  });

  Map<int, String> get avatarList => _avatarMap;

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
}
