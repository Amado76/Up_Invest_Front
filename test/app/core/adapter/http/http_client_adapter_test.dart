import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  final IHttpClientAdapter dioAdapter = DioAdapter(dio: dioMock);

  group('[get]', () {
    test('should return {"data": "data"} and status code 200', () async {
      //Arrange
      when(() => dioMock.get(any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'))).thenAnswer((_) async => dioResponse);
      //Act
      final result = await dioAdapter.get(
          path: 'path',
          headers: {'authToken': 'authToken', 'userId': 'userId'});
      //Assert
      expect(result.data, {'data': 'data'});
      expect(result.statusCode, 200);
    });
  });

  group('[put]', () {
    test('should return {"data": "data"} and status code 200', () async {
      //Arrange
      when(() => dioMock.put(any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'))).thenAnswer((_) async => dioResponse);
      //Act
      final result = await dioAdapter.put(
          path: 'path',
          headers: {'authToken': 'authToken', 'userId': 'userId'},
          data: {});
      //Assert
      expect(result.data, {'data': 'data'});
      expect(result.statusCode, 200);
    });
  });

  group('[delete]', () {
    test('should return {"data": "data"} and status code 200', () async {
      //Arrange
      when(() => dioMock.delete(any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'))).thenAnswer((_) async => dioResponse);
      //Act
      final result = await dioAdapter.delete(
          path: 'path',
          headers: {'authToken': 'authToken', 'userId': 'userId'},
          data: {});
      //Assert
      expect(result.data, {'data': 'data'});
      expect(result.statusCode, 200);
    });
  });
  group('[post]', () {
    test('should return {"data": "data"} and status code 200', () async {
      //Arrange
      when(() => dioMock.post(any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'))).thenAnswer((_) async => dioResponse);
      //Act
      final result = await dioAdapter.post(
          path: 'path',
          headers: {'authToken': 'authToken', 'userId': 'userId'},
          data: {});
      //Assert
      expect(result.data, {'data': 'data'});
      expect(result.statusCode, 200);
    });
  });
}

Response dioResponse = Response(
    data: {'data': 'data'},
    statusCode: 200,
    requestOptions: RequestOptions(path: 'path'));
