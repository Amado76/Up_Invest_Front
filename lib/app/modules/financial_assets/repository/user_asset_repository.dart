import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/user_asset_model.dart';
import 'package:up_invest_front/app/core/urls.dart';

sealed class IUserAssetRepository {
  Future<List<UserAssetModel>> getUserAssets(
      {required int userId, required String authToken});
  Future<void> deleteUserAsset(
      {required int userId, required String authToken, required int assetId});
  Future<void> deleteAllUserAssets(
      {required String authToken, required int userId});
}

class UserAssetRepository extends IUserAssetRepository {
  final IHttpClientAdapter httpClientAdapter;

  UserAssetRepository({required this.httpClientAdapter});
  String baseUrl = UrlsPaths.userAssetsUrlPath;

  @override
  Future<List<UserAssetModel>> getUserAssets(
      {required int userId, required String authToken}) async {
    final response = await httpClientAdapter.get(
        path: baseUrl, headers: {'userid': userId, 'authtoken': authToken});
    return (response.data as List)
        .map((e) => UserAssetModel.fromJson(e))
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
