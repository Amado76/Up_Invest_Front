import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/financial_assets/models/asset_model.dart';
import 'package:up_invest_front/app/core/urls.dart';

sealed class IAssetRepository {
  Future<List<AssetModel>> getAllAssetsCurrentPrice(
      {required int userId, required String authToken});
  Future<double> getSpecificAssetCurrentPrice(
      {required int userId, required String authToken, required int assetId});
}

class AssetRepository extends IAssetRepository {
  final IHttpClientAdapter httpClientAdapter;

  AssetRepository({required this.httpClientAdapter});
  String baseUrl = UrlsPaths.userAssetsUrlPath;

  @override
  Future<List<AssetModel>> getAllAssetsCurrentPrice(
      {required int userId, required String authToken}) async {
    final response = await httpClientAdapter.get(
        path: baseUrl, headers: {'userid': userId, 'authtoken': authToken});
    return (response.data as List).map((e) => AssetModel.fromJson(e)).toList();
  }

  @override
  Future<double> getSpecificAssetCurrentPrice(
      {required int userId,
      required String authToken,
      required int assetId}) async {
    final response = await httpClientAdapter.get(
        path: '$baseUrl/$assetId',
        headers: {'userid': userId, 'authtoken': authToken});
    if (response.data['currentprice'] is double) {
      return response.data['currentprice'];
    }
    if (response.data['currentprice'] is int) {
      return response.data['currentprice'].toDouble();
    }
    if (response.data['currentprice'] is String) {
      return double.parse(response.data['currentprice']);
    } else {
      throw Exception('invalid-json');
    }
  }
}
