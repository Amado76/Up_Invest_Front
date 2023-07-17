import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/core/adapter/http/http_client_adapter.dart';
import 'package:up_invest_front/app/modules/goals/model/goal_model.dart';
import 'package:up_invest_front/app/modules/goals/repository/goal_repository.dart';

import '../../../../mocks/core/adapter/dio_adapter_mock.dart';

void main() {
  final mockedDataResult = {
    'result': 'success',
  };
  final Response mockedResponse = Response(
    data: mockedDataResult,
    statusCode: 200,
    requestOptions: RequestOptions(path: ''),
  );
  final DioAdapter dioAdapterMock = DioAdapterMock();
  final GoalModel monthGoal = MonthInvestmentGoalModel(
      startDate: DateTime(2021, 01, 01),
      deadLine: DateTime(2021, 01, 31),
      id: 1,
      title: 'title',
      description: 'description',
      goalValue: 2.0,
      currentValue: 1.0,
      isCompleted: false,
      isMissed: false);
  const GoalModel patrimonyGoal = PatrimonyGoalModel(
      id: 2,
      title: 'title',
      description: 'description',
      goalValue: 2.0,
      currentValue: 1.0);
  const GoalModel passiveIncomeGoal = PassiveIncomeGoalModel(
      id: 3,
      title: 'title',
      description: 'description',
      goalValue: 2.0,
      currentValue: 1.0);
  final IGoalRepository goalRepository =
      GoalRepository(httpClientAdapter: dioAdapterMock);

  group('[createGoal]', () {
    test('should return a GoalModel', () async {
      //arrange
      when(() => dioAdapterMock.post(
                data: any(named: 'data'),
                path: any(named: 'path'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: monthInvestmentGoalJson, statusCode: 200));
      when(() => DioMock().post(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //act
      GoalModel result = await goalRepository.createGoal(
          userId: 1, authToken: 'authToken', goal: monthGoal);
      //assert

      expect(result, isA<MonthInvestmentGoalModel>());
    });
  });

  group('[deleteGoal]', () {
    test('should call [httpClientAdapter.delete]', () async {
      //arrange
      when(() => dioAdapterMock.delete(
                data: any(named: 'data'),
                path: any(named: 'path'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: monthInvestmentGoalJson, statusCode: 200));
      when(() => DioMock().delete(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //act
      goalRepository.deleteGoal(userId: 1, authToken: 'authToken', goalId: 1);
      //assert
      verify(() => dioAdapterMock.delete(
            data: any(named: 'data'),
            path: any(named: 'path'),
            headers: any(named: 'headers'),
          )).called(1);
    });
  });
  group('[getAllGoals]', () {
    test('should return a [List<GoalModel>]', () async {
      //arrange
      when(() => dioAdapterMock.get(
            path: any(named: 'path'),
            headers: any(named: 'headers'),
          )).thenAnswer((_) async => (data: goalsJson, statusCode: 200));
      when(() => DioMock().get(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //act
      final List<GoalModel> result =
          await goalRepository.getAllGoals(userId: 1, authToken: 'authToken');
      //assert
      expect(result, isA<List<GoalModel>>());
      expect(result[0], isA<MonthInvestmentGoalModel>());
      expect(result[1], isA<PatrimonyGoalModel>());
      expect(result[2], isA<PassiveIncomeGoalModel>());
    });
  });
  group('[getSpecificGoal]', () {
    test('should return a [GoalModel]', () async {
      //arrange
      when(() => dioAdapterMock.get(
                path: any(named: 'path'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: patrimonyGoalModelGoalJson, statusCode: 200));
      when(() => DioMock().get(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //act
      final GoalModel result = await goalRepository.getSpecificGoal(
          userId: 1, authToken: 'authToken', goalId: 2);
      //assert
      expect(result, isA<GoalModel>());
    });
  });
  group('[updateGoal]', () {
    test('should return a [GoalModel]', () async {
      //arrange
      when(() => dioAdapterMock.put(
                data: any(named: 'data'),
                path: any(named: 'path'),
                headers: any(named: 'headers'),
              ))
          .thenAnswer(
              (_) async => (data: patrimonyGoalModelGoalJson, statusCode: 200));
      when(() => DioMock().put(
            any(),
          )).thenAnswer((_) async => mockedResponse);
      //act
      final GoalModel result = await goalRepository.updateGoal(
          userId: 1, authToken: 'authToken', goalModel: patrimonyGoal);
      //assert
      expect(result, isA<GoalModel>());
    });
  });

  group('[goalFromJson]', () {
    test('should return a json MonthInvestmentGoalModel', () {
      //arrange
      final result = goalRepository.goalFromJson(monthInvestmentGoalJson);
      //assert
      expect(result, monthGoal);
    });
    test('should return a json PatrimonyGoalModel', () {
      //arrange
      final result = goalRepository.goalFromJson(patrimonyGoalModelGoalJson);
      //assert
      expect(result, patrimonyGoal);
    });
    test('should return a json passiveIncomeGoal', () {
      //arrange
      final result = goalRepository.goalFromJson(passiveIncomeGoalModelJson);
      //assert
      expect(result, passiveIncomeGoal);
    });
  });
}

final goalsJson = [
  monthInvestmentGoalJson,
  patrimonyGoalModelGoalJson,
  passiveIncomeGoalModelJson
];

final monthInvestmentGoalJson = {
  'id': 1,
  'title': 'title',
  'description': 'description',
  'goalValue': 2.0,
  'currentValue': 1.0,
  'achievementDate': null,
  'isCompleted': false,
  'startDate': '2021-01-01T00:00:00.000',
  'deadLine': '2021-01-31T00:00:00.000',
  'isMissed': false,
  'goalType': 'MonthInvestmentGoalModel'
};

final patrimonyGoalModelGoalJson = {
  'id': 2,
  'title': 'title',
  'description': 'description',
  'goalValue': 2.0,
  'currentValue': 1.0,
  'achievementDate': null,
  'isCompleted': false,
  'goalType': 'PatrimonyGoalModel'
};

final passiveIncomeGoalModelJson = {
  'id': 3,
  'title': 'title',
  'description': 'description',
  'goalValue': 2.0,
  'currentValue': 1.0,
  'achievementDate': null,
  'isCompleted': false,
  'goalType': 'PassiveIncomeGoalModel'
};
