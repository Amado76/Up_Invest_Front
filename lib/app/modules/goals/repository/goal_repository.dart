import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/core/urls.dart';
import 'package:up_invest_front/app/modules/goals/model/goal_model.dart';

sealed class IGoalRepository {
  Future<GoalModel> createGoal(
      {required int userId,
      required String authToken,
      required GoalModel goal});

  Future<int> deleteGoal(
      {required int userId, required String authToken, required int goalId});

  Future<List<GoalModel>> getAllGoals(
      {required int userId, required String authToken});
  Future<GoalModel> getSpecificGoal(
      {required int userId, required String authToken, required int goalId});

  Future<GoalModel> updateGoal(
      {required int userId,
      required String authToken,
      required GoalModel goalModel});
  @visibleForTesting
  GoalModel goalFromJson(Map<String, dynamic> json);
}

class GoalRepository extends IGoalRepository {
  final IHttpClientAdapter httpClientAdapter;

  GoalRepository({required this.httpClientAdapter});

  final String baseUrl = UrlsPaths.baseUserAssetsUrl;
  final String endPoint = UrlsPaths.dividendHistoryEndPoint;

  @override
  Future<GoalModel> createGoal(
      {required int userId,
      required String authToken,
      required GoalModel goal}) async {
    Map<String, dynamic> data = goal.toJson();
    var response = await httpClientAdapter.post(
        path: '$baseUrl/$endPoint',
        data: data,
        headers: {'authToken': authToken});

    return goalFromJson(response.data);
  }

  @override
  Future<int> deleteGoal(
      {required int userId,
      required String authToken,
      required int goalId}) async {
    var response = await httpClientAdapter.delete(
        path: '$baseUrl/$endPoint/$goalId', headers: {'authToken': authToken});

    return response.statusCode ?? 400;
  }

  @override
  Future<List<GoalModel>> getAllGoals(
      {required int userId, required String authToken}) async {
    var response = await httpClientAdapter.get(
        path: '$baseUrl/$endPoint',
        headers: {'authToken': authToken, 'userId': userId.toString()});
    return (response.data as List).map((e) => goalFromJson(e)).toList();
  }

  @override
  Future<GoalModel> getSpecificGoal(
      {required int userId,
      required String authToken,
      required int goalId}) async {
    var response = await httpClientAdapter.get(
        path: '$baseUrl/$endPoint/$goalId',
        headers: {'authToken': authToken, 'userId': userId.toString()});

    return goalFromJson(response.data);
  }

  @override
  Future<GoalModel> updateGoal(
      {required int userId,
      required String authToken,
      required GoalModel goalModel}) async {
    var response = await httpClientAdapter.put(
        path: '$baseUrl/$endPoint/${goalModel.id}',
        data: goalModel.toJson(),
        headers: {'authToken': authToken});
    return goalFromJson(response.data);
  }

  @override
  @visibleForTesting
  GoalModel goalFromJson(Map<String, dynamic> json) {
    if (json['goalType'] == 'MonthInvestmentGoalModel') {
      return MonthInvestmentGoalModel.fromJson(json);
    }
    if (json['goalType'] == 'PatrimonyGoalModel') {
      return PatrimonyGoalModel.fromJson(json);
    }
    return PassiveIncomeGoalModel.fromJson(json);
  }
}
