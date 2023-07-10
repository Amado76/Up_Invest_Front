import 'package:equatable/equatable.dart';

enum AssetCategory { usaStock, brStock, fii, fiagro }

class AssetCategoryModel extends Equatable {
  const AssetCategoryModel(
      {required this.category, required this.segment, this.subSegment});
  final AssetCategory category;
  final String segment;
  final String? subSegment;

  factory AssetCategoryModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'category': String category,
          'segment': String segment,
        }:
        return AssetCategoryModel(
          category: _stringToAssetCategory(category),
          segment: segment,
          subSegment: json['subSegment'],
        );
      default:
        throw Exception('invalid-json');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'category': categoryToString(category),
      'segment': segment,
      'subSegment': subSegment,
    };
  }

  copyWith({
    AssetCategory? category,
    String? segment,
    String? subSegment,
  }) {
    return AssetCategoryModel(
      category: category ?? this.category,
      segment: segment ?? this.segment,
      subSegment: subSegment ?? this.subSegment,
    );
  }

  String categoryToString(AssetCategory category) {
    switch (category) {
      case AssetCategory.brStock:
        return 'brStock';
      case AssetCategory.fii:
        return 'fii';
      case AssetCategory.usaStock:
        return 'usaStock';
      case AssetCategory.fiagro:
        return 'fiagro';
    }
  }

  static AssetCategory _stringToAssetCategory(String category) {
    switch (category) {
      case 'brStock':
        return AssetCategory.brStock;
      case 'fii':
        return AssetCategory.fii;
      case 'usaStock':
        return AssetCategory.usaStock;
      case 'fiagro':
        return AssetCategory.fiagro;
      default:
        throw Exception('invalid-category');
    }
  }

  @override
  List<Object?> get props => [category, segment, subSegment];
}
