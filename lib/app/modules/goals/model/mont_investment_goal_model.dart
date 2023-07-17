part of 'goal_model.dart';

class MonthInvestmentGoalModel extends GoalModel {
  const MonthInvestmentGoalModel({
    required this.startDate,
    required this.deadLine,
    this.isMissed = false,
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

  final DateTime startDate;
  final DateTime deadLine;
  final bool isMissed;

  factory MonthInvestmentGoalModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'title': String title,
          'description': String description,
          'goalValue': double goalValue,
          'currentValue': double currentValue,
          'achievementDate': String? achievementDate,
          'isCompleted': bool isCompleted,
          'startDate': String startDate,
          'deadLine': String deadLine,
          'isMissed': bool isMissed,
          'goalType': 'MonthInvestmentGoalModel'
        }:
        return MonthInvestmentGoalModel(
          id: id,
          title: title,
          description: description,
          goalValue: goalValue,
          currentValue: currentValue,
          achievementDate:
              achievementDate == null ? null : DateTime.parse(achievementDate),
          isCompleted: isCompleted,
          startDate: DateTime.parse(startDate),
          deadLine: DateTime.parse(deadLine),
          isMissed: isMissed,
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
      'startDate': startDate.toIso8601String(),
      'deadLine': deadLine.toIso8601String(),
      'isMissed': isMissed,
      'goalType': 'MonthInvestmentGoalModel'
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
    DateTime? startDate,
    DateTime? deadLine,
    bool? isMissed,
  }) {
    return MonthInvestmentGoalModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      goalValue: goalValue ?? this.goalValue,
      currentValue: currentValue ?? this.currentValue,
      achievementDate: achievementDate ?? this.achievementDate,
      isCompleted: isCompleted ?? this.isCompleted,
      startDate: startDate ?? this.startDate,
      deadLine: deadLine ?? this.deadLine,
      isMissed: isMissed ?? this.isMissed,
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
        achievementDate,
        startDate,
        deadLine,
        isMissed
      ];
}
