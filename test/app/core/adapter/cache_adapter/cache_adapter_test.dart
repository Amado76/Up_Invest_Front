import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/cache_adapter/cache_adapter.dart';

import '../../../../mocks/file_mock.dart';

class DefaultCacheManagerMock extends Mock implements DefaultCacheManager {}

void main() {
  final defaultCacheManager = DefaultCacheManagerMock();
  final cacheAdapter = FlutterCacheManager(
    defaultCacheManager: defaultCacheManager,
  );
  final fileMock = FileMock();

  group('[getSingleFile]', () {
    test('should return a File', () {
      when(() => defaultCacheManager.getSingleFile(any()))
          .thenAnswer((_) async => fileMock);
      expect(cacheAdapter.getSingleFile('url'), completion(fileMock));
    });
  });
  group('[removeFile]', () {
    test('should\'t return a error', () {
      when(() => defaultCacheManager.removeFile(any()))
          .thenAnswer((_) async {});
      expect(cacheAdapter.removeFile('url'), completion(null));
    });
  });
}
