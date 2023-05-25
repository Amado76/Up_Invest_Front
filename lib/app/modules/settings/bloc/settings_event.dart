part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

@immutable
class SettingsEventChangeThemeToDark extends SettingsEvent {
  const SettingsEventChangeThemeToDark();
}

@immutable
class SettingsEventChangeThemeToLight extends SettingsEvent {
  const SettingsEventChangeThemeToLight();
}

@immutable
class SettingsEventGetSavedSettings extends SettingsEvent {
  const SettingsEventGetSavedSettings();
}
