import 'package:equatable/equatable.dart';

enum FinancialAssetCategory { usaStock, brStock, fii, fiagro }

class FinancialAssetCategoryModel extends Equatable {
  const FinancialAssetCategoryModel(
      {required this.category, required this.segment, this.subSegment});
  final FinancialAssetCategory category;
  final String segment;
  final String? subSegment;

  factory FinancialAssetCategoryModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'category': String category,
          'segment': String segment,
        }:
        return FinancialAssetCategoryModel(
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
    FinancialAssetCategory? category,
    String? segment,
    String? subSegment,
  }) {
    return FinancialAssetCategoryModel(
      category: category ?? this.category,
      segment: segment ?? this.segment,
      subSegment: subSegment ?? this.subSegment,
    );
  }

  String categoryToString(FinancialAssetCategory category) {
    switch (category) {
      case FinancialAssetCategory.brStock:
        return 'brStock';
      case FinancialAssetCategory.fii:
        return 'fii';
      case FinancialAssetCategory.usaStock:
        return 'usaStock';
      case FinancialAssetCategory.fiagro:
        return 'fiagro';
    }
  }

  static FinancialAssetCategory _stringToAssetCategory(String category) {
    category = category.toLowerCase().trim();
    switch (category) {
      case 'brstock':
        return FinancialAssetCategory.brStock;
      case 'fii':
        return FinancialAssetCategory.fii;
      case 'usastock':
        return FinancialAssetCategory.usaStock;
      case 'fiagro':
        return FinancialAssetCategory.fiagro;
      default:
        throw Exception('invalid-category');
    }
  }

  @override
  List<Object?> get props => [category, segment, subSegment];
}
