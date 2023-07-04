import 'package:dio/dio.dart';

sealed class IHttpClientAdapter {
  Future<({dynamic data, int? statusCode})> get(
      {required String path,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters});

  Future<({dynamic data, int? statusCode})> post(
      {required String path,
      Map<String, dynamic>? headers,
      required Map<String, dynamic>? data});

  Future<({dynamic data, int? statusCode})> put(
      {required String path,
      required Map<String, dynamic>? headers,
      required Map<String, dynamic>? data});

  Future<({dynamic data, int? statusCode})> delete(
      {required String path,
      Map<String, dynamic>? headers,
      required Map<String, dynamic>? data});
}

class DioAdapter implements IHttpClientAdapter {
  DioAdapter({required this.dio});
  final Dio dio;

  @override
  Future<({dynamic data, int? statusCode})> get({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio
        .get(path,
            queryParameters: queryParameters,
            options: Options(headers: headers))
        .then((value) => (data: value.data, statusCode: value.statusCode));
  }

  @override
  Future<({dynamic data, int? statusCode})> post({
    required String path,
    Map<String, dynamic>? headers,
    required Map<String, dynamic>? data,
  }) async {
    return await dio
        .post(path, data: data, options: Options(headers: headers))
        .then((value) => (data: value.data, statusCode: value.statusCode));
  }

  @override
  Future<({dynamic data, int? statusCode})> put(
      {required String path,
      Map<String, dynamic>? headers,
      required Map<String, dynamic>? data}) async {
    return await dio
        .put(path, data: data, options: Options(headers: headers))
        .then((value) => (data: value.data, statusCode: value.statusCode));
  }

  @override
  Future<({dynamic data, int? statusCode})> delete(
      {required String path,
      Map<String, dynamic>? headers,
      required Map<String, dynamic>? data}) async {
    return await dio
        .delete(path, data: data, options: Options(headers: headers))
        .then((value) => (data: value.data, statusCode: value.statusCode));
  }
}
