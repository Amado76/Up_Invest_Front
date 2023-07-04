import 'package:equatable/equatable.dart';

class AchievementModel extends Equatable {
  const AchievementModel({
    required this.id,
    required this.title,
    required this.description,
    required this.badgeImage,
    required this.isCompleted,
    this.achievementDate,
  });

  final int id;
  final String title;
  final String description;
  final String badgeImage;
  final bool isCompleted;
  final DateTime? achievementDate;

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'title': String title,
          'description': String description,
          'badgeImage': String badgeImage,
          'isCompleted': bool isCompleted,
          'achievementDate': String? achievementDate,
        }:
        return AchievementModel(
            id: id,
            title: title,
            description: description,
            badgeImage: badgeImage,
            isCompleted: isCompleted,
            achievementDate: achievementDate == null
                ? null
                : DateTime.parse(achievementDate));
      default:
        {
          throw Exception('invalid-json');
        }
    }
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'badgeImage': badgeImage,
      'isCompleted': isCompleted,
      'achievementDate': achievementDate?.toIso8601String(),
    };
  }

  copyWith({
    int? id,
    String? title,
    String? description,
    String? badgeImage,
    bool? isCompleted,
    DateTime? achievementDate,
  }) {
    return AchievementModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      badgeImage: badgeImage ?? this.badgeImage,
      isCompleted: isCompleted ?? this.isCompleted,
      achievementDate: achievementDate ?? this.achievementDate,
    );
  }

  @override
  List<Object?> get props => [];
}
