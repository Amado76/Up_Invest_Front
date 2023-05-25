import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(const SettingsStateGlobal(themeMode: ThemeMode.system)) {
    on<SettingsEventChangeThemeToDark>((event, emit) {
      emit(const SettingsStateGlobal(themeMode: ThemeMode.dark));
    });
    on<SettingsEventChangeThemeToLight>((event, emit) {
      emit(const SettingsStateGlobal(themeMode: ThemeMode.light));
    });
  }
}
