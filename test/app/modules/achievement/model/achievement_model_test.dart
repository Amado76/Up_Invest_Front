import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/achievement/model/achievement_model.dart';

void main() {
  const badgeImage = 'badgeImage';
  const id = 1;
  const title = 'title';
  const description = 'description';
  const isCompleted = true;
  final achievementDate = DateTime(2023, 03, 10);
  final achievementModelMock = AchievementModel(
      id: id,
      title: title,
      description: description,
      badgeImage: badgeImage,
      isCompleted: isCompleted,
      achievementDate: achievementDate);

  test('supports value comparisons', () {
    expect(
        AchievementModel(
            id: id,
            title: title,
            description: description,
            badgeImage: badgeImage,
            isCompleted: isCompleted,
            achievementDate: achievementDate),
        AchievementModel(
            id: id,
            title: title,
            description: description,
            badgeImage: badgeImage,
            isCompleted: isCompleted,
            achievementDate: achievementDate));
  });

  group('[fromJson]', () {
    test('should return a valid model when the JSON has a valid data', () {
      //act
      final result = AchievementModel.fromJson(json);
      //assert
      expect(
        result.id,
        achievementModelMock.id,
      );
      expect(result.title, achievementModelMock.title);
      expect(result.description, achievementModelMock.description);
      expect(result.badgeImage, achievementModelMock.badgeImage);
      expect(result.isCompleted, achievementModelMock.isCompleted);
      expect(result.achievementDate, achievementModelMock.achievementDate);
    });

    test('should throw a FormatException when the JSON has a invalid data', () {
      //assert
      expect(() => AchievementModel.fromJson(invalidJson), throwsException);
    });
  });
  group('[toJson]', () {
    test('should return a JSON map containing the proper data', () {
      //act
      final result = achievementModelMock.toJson();
      //assert
      expect(result, json);
    });
  });

  group('[copyWith]', () {
    test('should return a copy of the model', () {
      //act
      final result = achievementModelMock.copyWith();
      //assert
      expect(result, achievementModelMock);
    });
    test('should return a copy of the model with diferent description', () {
      //act
      final AchievementModel result =
          achievementModelMock.copyWith(description: 'new description');
      //assert
      expect(result.description, 'new description');
    });
  });
}

final json = {
  'id': 1,
  'title': 'title',
  'description': 'description',
  'badgeImage': 'badgeImage',
  'isCompleted': true,
  'achievementDate': '2023-03-10T00:00:00.000'
};

final invalidJson = {
  'id': '1',
  'title': 'title',
  'description': 'description',
  'badgeImage': 'badgeImage',
  'isCompleted': true,
  'achievementDate': '2023-03-10T00:00:00.000'
};
