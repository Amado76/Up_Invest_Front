import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/repository/currency_exchange_repository.dart';

import '../../../../mocks/core/adapter/dio_adapter_mock.dart';

void main() async {
  final mockedReponse = {
    'result': 'success',
    'documentation': 'https://www.exchangerate-api.com/docs',
    'terms_of_use': 'https://www.exchangerate-api.com/terms',
    'time_last_update_unix': 1585267200,
    'time_last_update_utc': 'Fri, 27 Mar 2020 00:00:00 +0000',
    'time_next_update_unix': 1585270800,
    'time_next_update_utc': 'Sat, 28 Mar 2020 01:00:00 +0000',
    'base_code': 'USD',
    'target_code': 'BRL',
    'conversion_rate': 4.8
  };
  final DioAdapterMock dioAdapterMock = DioAdapterMock();
  final CurrencyExchangeRepository currencyExchangeRepository =
      CurrencyExchangeRepository(httpClientAdapter: DioAdapter(dio: Dio()));

  final CurrencyExchangeRepository currencyExchangeRepositoryWithMockedDio =
      CurrencyExchangeRepository(httpClientAdapter: dioAdapterMock);

  group('Real data', () {
    test('Should return a double value', () async {
      // Arrange
      const baseCurrency = 'USD';
      const targetCurrency = 'BRL';
      // Act
      final response = await currencyExchangeRepository.getExchangeRate(
          baseCurrency: baseCurrency, targetCurrency: targetCurrency);
      // Assert
      expect(response, isA<double>());
    }, skip: 'This test uses a external API');
    test('Should return a error', () async {
      // Arrange
      const baseCurrency = 'USDDD';
      const targetCurrency = 'BRL';
      // Act

      // Assert
      expect(
          () async => await currencyExchangeRepository.getExchangeRate(
              baseCurrency: baseCurrency, targetCurrency: targetCurrency),
          throwsException);
    }, skip: 'This test uses a external API');
  });

  group('Mocked Data', () {
    test('Should return a double value', () async {
      // Arrange
      const baseCurrency = 'USD';
      const targetCurrency = 'BRL';
      when(() => dioAdapterMock.get(path: any(named: 'path')))
          .thenAnswer((_) async => (data: mockedReponse, statusCode: 200));
      // Act
      final response =
          await currencyExchangeRepositoryWithMockedDio.getExchangeRate(
              baseCurrency: baseCurrency, targetCurrency: targetCurrency);
      // Assert
      expect(response, 4.8);
    });
  });
}
