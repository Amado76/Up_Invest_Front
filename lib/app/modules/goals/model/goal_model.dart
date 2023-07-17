import 'package:equatable/equatable.dart';
part 'patrimony_goal_model.dart';
part 'passive_income_goal_model.dart';
part 'mont_investment_goal_model.dart';

sealed class GoalModel extends Equatable {
  const GoalModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.goalValue,
      required this.currentValue,
      this.achievementDate,
      this.isCompleted = false});
  final int id;
  final String title;
  final String description;
  final double goalValue;
  final double currentValue;
  final bool isCompleted;
  final DateTime? achievementDate;

  Map<String, dynamic> toJson();
}
