part of 'radio_button_group_controller_bloc.dart';

@immutable
abstract class RadioButtonGroupControllerEvent {}

class RadioButtonSelect extends RadioButtonGroupControllerEvent {
  final Enum value;

  RadioButtonSelect({required this.value});
}
