part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

@immutable
class SettingsEventChangeTheme extends SettingsEvent {
  final String theme;
  const SettingsEventChangeTheme({required this.theme});
  @override
  List<Object> get props => [theme];
}

@immutable
class SettingsEventChangeLanguage extends SettingsEvent {
  final String language;
  const SettingsEventChangeLanguage({required this.language});
  @override
  List<Object> get props => [language];
}

@immutable
class SettingsEventFetchSavedSettings extends SettingsEvent {
  const SettingsEventFetchSavedSettings();
  @override
  List<Object> get props => [];
}
