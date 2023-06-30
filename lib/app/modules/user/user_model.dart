import 'package:equatable/equatable.dart';
import 'package:up_invest_front/app/modules/assets/models/asset_model.dart';

class UserModel extends Equatable {
  final int id;
  final List<AssetModel> assets;

  const UserModel({
    required this.id,
    required this.assets,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> assetsJson = json['assets'];
    final List<AssetModel> assets =
        assetsJson.map((dynamic json) => AssetModel.fromJson(json)).toList();

    return UserModel(
      id: json['id'],
      assets: assets,
    );
  }

  @override
  List<Object?> get props => [id, assets];
}
