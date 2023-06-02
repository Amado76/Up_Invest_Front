// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:up_invest_front/app/modules/auth/bloc/recovery_password/recover_password_bloc.dart';

void main() {
  group('[RecoverPasswordResetPassword]', () {
    test('supports value comparisons', () {
      expect(RecoverPasswordSendEmail(email: 'email'),
          RecoverPasswordSendEmail(email: 'email'));
    });
  });
}
