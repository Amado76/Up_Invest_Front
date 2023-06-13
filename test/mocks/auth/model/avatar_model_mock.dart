import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/model/avatar_model.dart';

class CustomAvatarMock extends Mock implements CustomAvatar {
  @override
  int? get id => 9;
  @override
  String get path => 'path';
  @override
  String get url => 'url';
}

class NetworkdAvatarMock extends Mock implements NetworkAvatar {
  @override
  int? get id => 9;
  @override
  String get path => 'path';
  @override
  String get url => 'url';
}

class StandardAvatarMock extends Mock implements StandardAvatar {
  @override
  int? get id => 1;
  @override
  String get path => 'assets/avatars/kitty.png';
  @override
  String get url => 'https://i.ibb.co/m6NHwyd/kitty.png';
}
