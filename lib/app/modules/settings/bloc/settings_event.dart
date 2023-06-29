part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent extends Equatable {
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
class SettingsEventChangeCurrency extends SettingsEvent {
  final Currency currency;
  const SettingsEventChangeCurrency({required this.currency});
  @override
  List<Object> get props => [currency];
}

@immutable
class SettingsEventFetchSavedSettings extends SettingsEvent {
  const SettingsEventFetchSavedSettings();
  @override
  List<Object> get props => [];
}
