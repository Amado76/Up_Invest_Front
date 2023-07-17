part of 'goal_model.dart';

class PassiveIncomeGoalModel extends GoalModel {
  const PassiveIncomeGoalModel({
    required int id,
    required String title,
    required String description,
    required goalValue,
    required currentValue,
    DateTime? achievementDate,
    bool isCompleted = false,
  }) : super(
            goalValue: goalValue,
            currentValue: currentValue,
            id: id,
            title: title,
            description: description,
            achievementDate: achievementDate,
            isCompleted: isCompleted);

  factory PassiveIncomeGoalModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'title': String title,
          'description': String description,
          'goalValue': double goalValue,
          'currentValue': double currentValue,
          'achievementDate': String? achievementDate,
          'isCompleted': bool isCompleted,
          'goalType': 'PassiveIncomeGoalModel'
        }:
        return PassiveIncomeGoalModel(
          id: id,
          title: title,
          description: description,
          goalValue: goalValue,
          currentValue: currentValue,
          achievementDate:
              achievementDate == null ? null : DateTime.parse(achievementDate),
          isCompleted: isCompleted,
        );
      default:
        {
          throw Exception('invalid-json');
        }
    }
  }

  @override
  toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'goalValue': goalValue,
      'currentValue': currentValue,
      'achievementDate': achievementDate?.toIso8601String(),
      'isCompleted': isCompleted,
      'goalType': 'PassiveIncomeGoalModel'
    };
  }

  copyWith({
    int? id,
    String? title,
    String? description,
    double? goalValue,
    double? currentValue,
    DateTime? achievementDate,
    bool? isCompleted,
  }) {
    return PassiveIncomeGoalModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      goalValue: goalValue ?? this.goalValue,
      currentValue: currentValue ?? this.currentValue,
      achievementDate: achievementDate ?? this.achievementDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        goalValue,
        currentValue,
        isCompleted,
        achievementDate
      ];
}
