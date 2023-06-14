// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/settings/bloc/settings/edit_details_bloc.dart';

void main() {
  const String avatarNavigation = 'avatarNavigation';
  const String imagePath = 'imagePath';
  group('[EditDetailsChangeAvatar]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsChangeDisplayAvatar(avatarNavigation: avatarNavigation),
        EditDetailsChangeDisplayAvatar(avatarNavigation: avatarNavigation),
      );
    });
  });
  group('[EditDetailsUploadPhoto]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsAddAvatarFromGallery(imagePath: imagePath),
        EditDetailsAddAvatarFromGallery(imagePath: imagePath),
      );
    });
  });

  group('[EditDetailsUpdateAccountDetails]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsUpdateAvatar(),
        EditDetailsUpdateAvatar(),
      );
    });
  });
  group('[EditDetailsCleanAvatarList]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsCleanAvatarList(),
        EditDetailsCleanAvatarList(),
      );
    });
  });
  group('[EditDetailsCancelAvatarEdit]', () {
    test('supports value comparisons', () {
      expect(
        EditDetailsCancelAvatarEdit(),
        EditDetailsCancelAvatarEdit(),
      );
    });
  });
}
