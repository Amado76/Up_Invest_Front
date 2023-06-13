// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';

void main() {
  const String avatarNavigation = 'avatarNavigation';
  const String imagePath = 'imagePath';
  group('[EditDetailsChangeAvatar]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsChangeAvatar(avatarNavigation: avatarNavigation),
        EditDetailsChangeAvatar(avatarNavigation: avatarNavigation),
      );
    });
  });
  group('[EditDetailsUploadPhoto]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsUploadPhoto(imagePath: imagePath),
        EditDetailsUploadPhoto(imagePath: imagePath),
      );
    });
  });
  group('[EditDetailsChangeAvatar]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsAddToAvatarList(imagePath: imagePath),
        EditDetailsAddToAvatarList(imagePath: imagePath),
      );
    });
  });
}
