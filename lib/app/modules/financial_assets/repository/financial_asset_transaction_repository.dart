import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/core/urls.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_transaction.dart';

sealed class IFinancialAssetTransactionRepository {
  Future<List<FinancialAssetTransaction>> getAllTransactionHistory(
      {required int userId, required String authToken});
  Future<FinancialAssetTransaction> getSpecificTransactionHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int transactionId});
  Future<FinancialAssetTransaction> createTransaction(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetTransaction transactionHistory});
  Future<FinancialAssetTransaction> updateTransactionHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetTransaction transactionHistory});
  Future<int> deleteTransactionHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int transactionId});
}

class FinancialAssetTransactionRepository
    extends IFinancialAssetTransactionRepository {
  FinancialAssetTransactionRepository({required this.httpClientAdapter});
  final IHttpClientAdapter httpClientAdapter;
  final String baseUrl = UrlsPaths.baseUserAssetsUrl;
  final String endPoint = UrlsPaths.transactionHistoryEndPoint;
  @override
  Future<FinancialAssetTransaction> createTransaction(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetTransaction transactionHistory}) async {
    Map<String, dynamic> data = transactionHistory.toJson();
    var response = await httpClientAdapter.post(
        path: '$baseUrl/$assetId/$endPoint',
        data: data,
        headers: {'authToken': authToken});

    return FinancialAssetTransaction.fromJson(response.data);
  }

  @override
  Future<int> deleteTransactionHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int transactionId}) async {
    var response = await httpClientAdapter.delete(
        path: '$baseUrl/$assetId/$endPoint/$transactionId',
        headers: {'authToken': authToken});

    return response.statusCode ?? 400;
  }

  @override
  Future<List<FinancialAssetTransaction>> getAllTransactionHistory(
      {required int userId, required String authToken}) async {
    var response = await httpClientAdapter.get(
        path: '$baseUrl/$endPoint',
        headers: {'authToken': authToken, 'userId': userId.toString()});

    return (response.data as List)
        .map((e) => FinancialAssetTransaction.fromJson(e))
        .toList();
  }

  @override
  Future<FinancialAssetTransaction> getSpecificTransactionHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required int transactionId}) async {
    var response = await httpClientAdapter.get(
        path: '$baseUrl/$assetId/$endPoint/$transactionId',
        headers: {'authToken': authToken, 'userId': userId.toString()});

    return FinancialAssetTransaction.fromJson(response.data);
  }

  @override
  Future<FinancialAssetTransaction> updateTransactionHistory(
      {required int userId,
      required String authToken,
      required int assetId,
      required FinancialAssetTransaction transactionHistory}) async {
    var response = await httpClientAdapter.post(
        path: '$baseUrl/$assetId/$endPoint/${transactionHistory.id}',
        data: transactionHistory.toJson(),
        headers: {'authToken': authToken});
    return FinancialAssetTransaction.fromJson(response.data);
  }
}
