part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

@immutable
class SettingsEventChangeTheme extends SettingsEvent {
  final String theme;
  const SettingsEventChangeTheme({required this.theme});
}

@immutable
class SettingsEventFetchSavedSettings extends SettingsEvent {
  const SettingsEventFetchSavedSettings();
}
