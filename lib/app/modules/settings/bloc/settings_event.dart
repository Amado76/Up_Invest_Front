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
class SettingsEventChangeThemeToSystem extends SettingsEvent {
  const SettingsEventChangeThemeToSystem();
}

@immutable
class SettingsEventFetchSavedSettings extends SettingsEvent {
  const SettingsEventFetchSavedSettings();
}
