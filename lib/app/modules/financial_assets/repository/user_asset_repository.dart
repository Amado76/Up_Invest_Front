import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/user_asset_model.dart';
import 'package:up_invest_front/app/core/urls.dart';

sealed class IUserAssetRepository {}

class UserAssetRepository {
  final IHttpClientAdapter httpClientAdapter;

  UserAssetRepository({required this.httpClientAdapter});
  String baseUrl = UrlsPaths.userAssetsUrlPath;

  Future<List<UserAssetModel>> getUserAssets(
      {required int userId, required String authToken}) async {
    final response = await httpClientAdapter.get(
        path: baseUrl, headers: {'userid': userId, 'authtoken': authToken});
    return (response.data as List)
        .map((e) => UserAssetModel.fromJson(e))
        .toList();
  }

  Future<void> deleteUserAsset(
      {required int userId,
      required String authToken,
      required int assetId}) async {
    await httpClientAdapter.delete(
        path: '$baseUrl/$assetId',
        headers: {'userid': userId, 'authtoken': authToken});
  }

  Future<void> deleteAllUserAssets(
      {required String authToken, required int userId}) async {
    await httpClientAdapter.delete(
        path: '$baseUrl/all',
        headers: {'userid': userId, 'authtoken': authToken});
  }
}
