// ignore_for_file: depend_on_referenced_packages

import 'dart:io' show File;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/util/asset_to_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  group('description', () {
    setUp(() async {
      PathProviderPlatform.instance = FakePathProviderPlatform();
    });
    const pathTest = 'assets/avatars/crocodile.png';

    test('Asset to file', () async {
      //act

      File file = await LocalFileHelper().getImageFileFromAssets(pathTest);

      //assert
      expect(file, isA<File>());
    });
  });
}

class FakePathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() {
    return Future.value('/tmp');
  }
}
