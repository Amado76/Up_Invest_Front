import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/financial_asset_model.dart';
import 'package:up_invest_front/app/core/urls.dart';

sealed class IFinancialAssetRepository {
  Future<List<FinancialAssetModel>> getAllAssets(
      {required int userId, required String authToken});
  Future<FinancialAssetModel> getSpecificAsset(
      {required int userId, required String authToken, required int assetId});
}

class FinancialAssetRepository extends IFinancialAssetRepository {
  final IHttpClientAdapter httpClientAdapter;

  FinancialAssetRepository({required this.httpClientAdapter});
  String baseUrl = UrlsPaths.baseFinancialAssetUrl;

  @override
  Future<List<FinancialAssetModel>> getAllAssets(
      {required int userId, required String authToken}) async {
    final response = await httpClientAdapter.get(
        path: baseUrl, headers: {'userid': userId, 'authtoken': authToken});
    return (response.data as List)
        .map((e) => FinancialAssetModel.fromJson(e))
        .toList();
  }

  @override
  Future<FinancialAssetModel> getSpecificAsset(
      {required int userId,
      required String authToken,
      required int assetId}) async {
    final response = await httpClientAdapter.get(
        path: '$baseUrl/$assetId',
        headers: {'userid': userId, 'authtoken': authToken});
    return FinancialAssetModel.fromJson(response.data);
  }
}
