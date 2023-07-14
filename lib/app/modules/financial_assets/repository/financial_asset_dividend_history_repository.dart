import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/core/urls.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_dividend_history.dart';

sealed class IFinancialAssetDividendHistoryRepository {
  Future<List<FinancialAssetDividendHistory>> getAllDividendHistory(
      {required int userId, required String authToken});
  Future<FinancialAssetDividendHistory> getSpecificDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int dividendId});
  Future<FinancialAssetDividendHistory> createDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetDividendHistory dividendHistory});
  Future<FinancialAssetDividendHistory> updateDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetDividendHistory dividendHistory});
  Future<int> deleteDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int dividendId});
}

class FinancialAssetDividendHistoryRepository
    extends IFinancialAssetDividendHistoryRepository {
  final IHttpClientAdapter httpClientAdapter;

  FinancialAssetDividendHistoryRepository({required this.httpClientAdapter});
  final String baseUrl = UrlsPaths.baseUserAssetsUrl;
  final String endPoint = UrlsPaths.dividendHistoryEndPoint;

  @override
  Future<FinancialAssetDividendHistory> createDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetDividendHistory dividendHistory}) async {
    Map<String, dynamic> data = dividendHistory.toJson();
    var response = await httpClientAdapter.post(
        path: '$baseUrl/$assetId/$endPoint',
        data: data,
        headers: {'authToken': authToken});

    return FinancialAssetDividendHistory.fromJson(response.data);
  }

  @override
  Future<int> deleteDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int dividendId}) async {
    var response = await httpClientAdapter.delete(
        path: '$baseUrl/$assetId/$endPoint/$dividendId',
        headers: {'authToken': authToken});

    return response.statusCode ?? 400;
  }

  @override
  Future<List<FinancialAssetDividendHistory>> getAllDividendHistory(
      {required int userId, required String authToken}) async {
    var response = await httpClientAdapter.get(
        path: '$baseUrl/$endPoint',
        headers: {'authToken': authToken, 'userId': userId.toString()});

    return (response.data as List)
        .map((e) => FinancialAssetDividendHistory.fromJson(e))
        .toList();
  }

  @override
  Future<FinancialAssetDividendHistory> getSpecificDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int dividendId}) async {
    var response = await httpClientAdapter.get(
        path: '$baseUrl/$assetId/$endPoint/$dividendId',
        headers: {'authToken': authToken, 'userId': userId.toString()});

    return FinancialAssetDividendHistory.fromJson(response.data);
  }

  @override
  Future<FinancialAssetDividendHistory> updateDividendHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetDividendHistory dividendHistory}) async {
    var response = await httpClientAdapter.post(
        path: '$baseUrl/$assetId/$endPoint/${dividendHistory.id}',
        data: dividendHistory.toJson(),
        headers: {'authToken': authToken});
    return FinancialAssetDividendHistory.fromJson(response.data);
  }
}
