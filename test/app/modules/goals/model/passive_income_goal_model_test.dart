import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/goals/model/goal_model.dart';

void main() {
  const int id = 1;
  const String title = 'title';
  const String description = 'description';
  const double goalValue = 1000;
  const double currentValue = 100;
  const bool isCompleted = true;
  DateTime achievementDate = DateTime(2021, 1, 1);

  final PassiveIncomeGoalModel passiveIncomeGoalMock = PassiveIncomeGoalModel(
    id: id,
    title: title,
    description: description,
    goalValue: goalValue,
    currentValue: currentValue,
    achievementDate: achievementDate,
    isCompleted: isCompleted,
  );

  test('supports value comparisons', () {
    expect(
        PassiveIncomeGoalModel(
          id: id,
          title: title,
          description: description,
          goalValue: goalValue,
          currentValue: currentValue,
          achievementDate: achievementDate,
          isCompleted: isCompleted,
        ),
        PassiveIncomeGoalModel(
          id: id,
          title: title,
          description: description,
          goalValue: goalValue,
          currentValue: currentValue,
          achievementDate: achievementDate,
          isCompleted: isCompleted,
        ));
  });
  group('[fromJson]', () {
    test('should return a valid model when the JSON has a valid data', () {
      //act
      final result = PassiveIncomeGoalModel.fromJson(json);
      //assert
      expect(
        result.id,
        passiveIncomeGoalMock.id,
      );
      expect(result.title, passiveIncomeGoalMock.title);
      expect(result.description, passiveIncomeGoalMock.description);
      expect(result.goalValue, passiveIncomeGoalMock.goalValue);
      expect(result.currentValue, passiveIncomeGoalMock.currentValue);
      expect(result.isCompleted, passiveIncomeGoalMock.isCompleted);
      expect(result.achievementDate, passiveIncomeGoalMock.achievementDate);
    });

    test('should throw a FormatException when the JSON has a invalid data', () {
      //assert
      expect(
          () => PassiveIncomeGoalModel.fromJson(invalidJson), throwsException);
    });
  });
  group('[toJson]', () {
    test('should return a JSON map containing the proper data', () {
      //act
      final result = passiveIncomeGoalMock.toJson();
      //assert
      expect(result, json);
    });
  });
  group('[copyWith]', () {
    test('should return a copy of the model', () {
      //act
      final result = passiveIncomeGoalMock.copyWith();
      //assert
      expect(result, passiveIncomeGoalMock);
    });
    test('should return a copy of the model with diferent description', () {
      //act
      final PassiveIncomeGoalModel result =
          passiveIncomeGoalMock.copyWith(description: 'new description');
      //assert
      expect(result.description, 'new description');
    });
  });
}

final json = {
  'id': 1,
  'title': 'title',
  'description': 'description',
  'goalValue': 1000.00,
  'currentValue': 100.00,
  'isCompleted': true,
  'achievementDate': '2021-01-01T00:00:00.000',
};
final invalidJson = {
  'id': '1',
  'title': 'title',
  'description': 'description',
  'goalValue': 1000,
  'currentValue': 100,
  'isCompleted': false,
  'achievementDate': null,
};
