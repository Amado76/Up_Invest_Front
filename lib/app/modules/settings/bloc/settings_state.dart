// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  final ThemeMode themeMode;
  const SettingsState({required this.themeMode});
}

@immutable
class SettingsStateGlobal extends SettingsState {
  const SettingsStateGlobal({
    required super.themeMode,
  });

  @override
  List<Object> get props => [super.themeMode];
}
