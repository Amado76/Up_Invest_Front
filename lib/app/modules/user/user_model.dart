import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/assets/models/user_asset_model.dart';

class UserModel extends Equatable {
  final int id;
  final List<UserAssetModel> assets;

  const UserModel({
    required this.id,
    required this.assets,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
          'id': int id,
          'assets': List<dynamic> assets,
        }:
        return UserModel(
          id: id,
          assets: assets
              .map((dynamic json) => UserAssetModel.fromJson(json))
              .toList(),
        );
      default:
        throw Exception('invalid-json');
    }
  }

  toJson() {
    return {
      'id': id,
      'assets': assets.map((asset) => asset.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, assets];
}
