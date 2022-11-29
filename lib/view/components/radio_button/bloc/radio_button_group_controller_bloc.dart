import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radio_button_group_controller_event.dart';
part 'radio_button_group_controller_state.dart';

class RadioButtonGroupControllerBloc extends Bloc<
    RadioButtonGroupControllerEvent, RadioButtonGroupControllerState> {
  late Enum selected;

  RadioButtonGroupControllerBloc()
      : super(RadioButtonGroupControllerInitial()) {
    on<RadioButtonGroupControllerEvent>((event, emit) {
      if (event is RadioButtonSelect) {
        
        selected = event.value;
        emit(
          RadioButtonGroupControllerSelected(
            value: selected,
          ),
        );
      }
    });
  }
}
