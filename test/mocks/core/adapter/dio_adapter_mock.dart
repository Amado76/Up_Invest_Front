import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';

class DioAdapterMock extends Mock implements DioAdapter {}

class DioMock extends Mock implements Dio {}
