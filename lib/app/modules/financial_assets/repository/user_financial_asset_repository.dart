import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/user_financial_asset_model.dart';
import 'package:up_invest_front/app/core/urls.dart';

sealed class IUserFinancialAssetRepository {
  Future<List<FinancialUserAssetModel>> getUserAssets(
      {required int userId, required String authToken});
  Future<void> deleteUserAsset(
      {required int userId, required String authToken, required int assetId});
  Future<void> deleteAllUserAssets(
      {required String authToken, required int userId});
}

class UserFinancialAssetRepository extends IUserFinancialAssetRepository {
  final IHttpClientAdapter httpClientAdapter;

  UserFinancialAssetRepository({required this.httpClientAdapter});
  String baseUrl = UrlsPaths.baseUserAssetsUrl;

  @override
  Future<List<FinancialUserAssetModel>> getUserAssets(
      {required int userId, required String authToken}) async {
    final response = await httpClientAdapter.get(
        path: baseUrl, headers: {'userid': userId, 'authtoken': authToken});
    return (response.data as List)
        .map((e) => FinancialUserAssetModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> deleteUserAsset(
      {required int userId,
      required String authToken,
      required int assetId}) async {
    await httpClientAdapter.delete(
        path: '$baseUrl/$assetId',
        headers: {'userid': userId, 'authtoken': authToken});
  }

  @override
  Future<void> deleteAllUserAssets(
      {required String authToken, required int userId}) async {
    await httpClientAdapter.delete(
        path: baseUrl, headers: {'userid': userId, 'authtoken': authToken});
  }
}
