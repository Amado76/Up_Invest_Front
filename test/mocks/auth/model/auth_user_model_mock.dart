import 'package:mocktail/mocktail.dart';
import 'package:up_invest_front/app/modules/auth/model/auth_user_model.dart';

class AuthUserModelMock extends Mock implements AuthUserModel {
  @override
  String get userId => 'SoItSeemsLikeThisInternetThingIsHereToStay.';
  @override
  String get email => 'chandler@bing.com';
  @override
  String get token => 'IMakeJokesWhenIamUncomfortable.';
  @override
  String get displayName => 'Chandler Bing';
  @override
  String get avatar => 'https://i.ibb.co/m6NHwyd/kitty.png';
  @override
  String get signInMethod => 'facebook';
  @override
  bool get isEmailVerified => true;
}
