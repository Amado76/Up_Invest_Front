import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/goals/model/goal_model.dart';

void main() {
  const int id = 1;
  const String title = 'title';
  const String description = 'description';
  const double goalValue = 1000;
  const double currentValue = 100;
  const bool isCompleted = false;
  const DateTime? achievementDate = null;
  final DateTime startDate = DateTime(2023, 03, 01);
  final DateTime deadLine = DateTime(2023, 03, 31);
  const bool isMissed = true;

  final MonthInvestmentGoalModel monthInvestmentMissedGoalMock =
      MonthInvestmentGoalModel(
          id: id,
          title: title,
          description: description,
          goalValue: goalValue,
          currentValue: currentValue,
          achievementDate: achievementDate,
          startDate: startDate,
          deadLine: deadLine,
          isCompleted: isCompleted,
          isMissed: isMissed);
  final MonthInvestmentGoalModel monthInvestmentCompletedGoalMock =
      MonthInvestmentGoalModel(
          id: id,
          title: title,
          description: description,
          goalValue: goalValue,
          currentValue: currentValue,
          achievementDate: DateTime(2023, 03, 31),
          startDate: startDate,
          deadLine: deadLine,
          isCompleted: true,
          isMissed: false);

  test('supports value comparisons', () {
    expect(
        MonthInvestmentGoalModel(
            id: id,
            title: title,
            description: description,
            goalValue: goalValue,
            currentValue: currentValue,
            achievementDate: achievementDate,
            startDate: startDate,
            deadLine: deadLine,
            isCompleted: isCompleted,
            isMissed: isMissed),
        MonthInvestmentGoalModel(
            id: id,
            title: title,
            description: description,
            goalValue: goalValue,
            currentValue: currentValue,
            achievementDate: achievementDate,
            startDate: startDate,
            deadLine: deadLine,
            isCompleted: isCompleted,
            isMissed: isMissed));
  });
  group('[fromJson]', () {
    test(
        'should return a valid model (missedGoal) when the JSON has a valid data',
        () {
      //act
      final result = MonthInvestmentGoalModel.fromJson(goalMissedJson);
      //assert
      expect(
        result.id,
        monthInvestmentMissedGoalMock.id,
      );
      expect(result.title, monthInvestmentMissedGoalMock.title);
      expect(result.description, monthInvestmentMissedGoalMock.description);
      expect(result.goalValue, monthInvestmentMissedGoalMock.goalValue);
      expect(result.currentValue, monthInvestmentMissedGoalMock.currentValue);
      expect(result.isCompleted, monthInvestmentMissedGoalMock.isCompleted);
      expect(result.achievementDate,
          monthInvestmentMissedGoalMock.achievementDate);
      expect(result.startDate, monthInvestmentMissedGoalMock.startDate);
      expect(result.deadLine, monthInvestmentMissedGoalMock.deadLine);
      expect(result.isMissed, monthInvestmentMissedGoalMock.isMissed);
    });
    test(
        'should return a valid model (completedGoal) when the JSON has a valid data',
        () {
      //act
      final result = MonthInvestmentGoalModel.fromJson(goalCompletedJson);
      //assert
      expect(
        result.id,
        monthInvestmentCompletedGoalMock.id,
      );
      expect(result.title, monthInvestmentCompletedGoalMock.title);
      expect(result.description, monthInvestmentCompletedGoalMock.description);
      expect(result.goalValue, monthInvestmentCompletedGoalMock.goalValue);
      expect(
          result.currentValue, monthInvestmentCompletedGoalMock.currentValue);
      expect(result.isCompleted, monthInvestmentCompletedGoalMock.isCompleted);
      expect(result.achievementDate,
          monthInvestmentCompletedGoalMock.achievementDate);
      expect(result.startDate, monthInvestmentCompletedGoalMock.startDate);
      expect(result.deadLine, monthInvestmentCompletedGoalMock.deadLine);
      expect(result.isMissed, monthInvestmentCompletedGoalMock.isMissed);
    });

    test('should throw a FormatException when the JSON has a invalid data', () {
      //assert
      expect(() => MonthInvestmentGoalModel.fromJson(invalidJson),
          throwsException);
    });
  });
  group('[toJson]', () {
    test('should return a JSON map containing the proper data', () {
      //act
      final result = monthInvestmentMissedGoalMock.toJson();
      //assert
      expect(result, goalMissedJson);
    });
  });
  group('[copyWith]', () {
    test('should return a copy of the model', () {
      //act
      final result = monthInvestmentMissedGoalMock.copyWith();
      //assert
      expect(result, monthInvestmentMissedGoalMock);
    });
    test('should return a copy of the model with diferent description', () {
      //act
      final MonthInvestmentGoalModel result = monthInvestmentMissedGoalMock
          .copyWith(description: 'new description');
      //assert
      expect(result.description, 'new description');
    });
  });
}

final goalMissedJson = {
  'id': 1,
  'title': 'title',
  'description': 'description',
  'goalValue': 1000.00,
  'currentValue': 100.00,
  'isCompleted': false,
  'achievementDate': null,
  'startDate': '2023-03-01T00:00:00.000',
  'deadLine': '2023-03-31T00:00:00.000',
  'isMissed': true
};
final goalCompletedJson = {
  'id': 1,
  'title': 'title',
  'description': 'description',
  'goalValue': 1000.00,
  'currentValue': 100.00,
  'isCompleted': true,
  'achievementDate': '2023-03-31T00:00:00.000',
  'startDate': '2023-03-01T00:00:00.000',
  'deadLine': '2023-03-31T00:00:00.000',
  'isMissed': false
};
final invalidJson = {
  'id': '1',
  'title': 'title',
  'description': 'description',
  'goalValue': 1000,
  'currentValue': 100,
  'isCompleted': false,
  'achievementDate': null,
  'startDate': '2023-03-01T00:00:00.000',
  'deadLine': '2023-03-31T00:00:00.000',
  'isMissed': true
};
