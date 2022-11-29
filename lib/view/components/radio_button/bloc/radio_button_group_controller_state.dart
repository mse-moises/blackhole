part of 'radio_button_group_controller_bloc.dart';

@immutable
abstract class RadioButtonGroupControllerState {}

class RadioButtonGroupControllerInitial
    extends RadioButtonGroupControllerState {}

class RadioButtonGroupControllerSelected
    extends RadioButtonGroupControllerState {
  final Enum value;

  RadioButtonGroupControllerSelected({required this.value});
}
