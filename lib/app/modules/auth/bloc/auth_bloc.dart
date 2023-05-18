import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_event.dart';
import 'package:up_invest_front/app/modules/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateLoggedOut(isLoading: false));
}
