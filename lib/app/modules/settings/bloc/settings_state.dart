// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  final SettingsModel settingsModel;

  const SettingsState({required this.settingsModel});
}

@immutable
class SettingsStateGlobal extends SettingsState {
  const SettingsStateGlobal({
    required super.settingsModel,
  });

  @override
  List<Object> get props => [super.settingsModel];
}
