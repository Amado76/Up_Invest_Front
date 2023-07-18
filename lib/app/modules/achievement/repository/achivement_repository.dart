import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/core/urls.dart';
import 'package:up_invest_front/app/modules/achievement/model/achievement_model.dart';

sealed class IAchivementRepository {
  Future<List<AchievementModel>> getAllAchievements(
      {required int userId, required String authToken});
}

class AchivementRepository extends IAchivementRepository {
  final IHttpClientAdapter httpClientAdapter;
  final String baseUrl = UrlsPaths.baseUserAssetsUrl;
  final String endPoint = UrlsPaths.dividendHistoryEndPoint;

  @override
  Future<List<AchievementModel>> getAllAchievements(
      {required int userId, required String authToken}) async {
    var response = await httpClientAdapter.get(
        path: '$baseUrl/$endPoint',
        headers: {'authToken': authToken, 'userId': userId.toString()});
    return (response.data as List)
        .map((e) => AchievementModel.fromJson(e))
        .toList();
  }

  AchivementRepository({required this.httpClientAdapter});
}
