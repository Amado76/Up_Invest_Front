import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

sealed class ICacheAdapter {
  Future<File> getSingleFile(String url);
  Future<void> removeFile(String url);
}

class FlutterCacheManager extends ICacheAdapter {
  final DefaultCacheManager defaultCacheManager;

  FlutterCacheManager({required this.defaultCacheManager});

  @override
  Future<File> getSingleFile(String url) async {
    final file = await defaultCacheManager.getSingleFile(url);

    return file;
  }

  @override
  Future<void> removeFile(String url) async {
    await defaultCacheManager.removeFile(url);
  }
}
