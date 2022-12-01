import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_button_group_controller_event.dart';
part 'radio_button_group_controller_state.dart';

class RadioButtonGroupControllerBloc extends Bloc<
    RadioButtonGroupControllerEvent, RadioButtonGroupControllerState> {
  Enum? selected;
  Function(Enum)? onChangeRadioOption;

  RadioButtonGroupControllerBloc()
      : super(RadioButtonGroupControllerInitial()) {
    on<RadioButtonGroupControllerEvent>((event, emit) {
      if (event is RadioButtonSelect) {

        if (selected != event.value && onChangeRadioOption != null){
          onChangeRadioOption!(event.value);
        }

        selected = event.value;
        emit(
          RadioButtonGroupControllerSelected(
            value: selected!,
          ),
        );
      }
    });
  }

  void setOnChange(Function(Enum)? _onChange) {
    onChangeRadioOption = _onChange;
  }
}
