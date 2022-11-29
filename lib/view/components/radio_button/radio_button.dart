import 'package:blackhole/const/const_business_rules.dart';
import 'package:blackhole/view/components/radio_button/bloc/radio_button_group_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButton extends StatelessWidget {
  RadioButton({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final Enum value;

  late final RadioButtonGroupControllerBloc blocController;

  void setController(RadioButtonGroupControllerBloc _blocController) {
    blocController = _blocController;
  }

  setRadioValue() {
    blocController.add(
      RadioButtonSelect(value: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonGroupControllerBloc, RadioButtonGroupControllerState>(
      builder: (context, state) {
        bool isSelected = false;

        if(state is RadioButtonGroupControllerSelected){
          isSelected = state.value == value;
        }

        return TextButton(
          onPressed: setRadioValue,
          child: Text(title + (isSelected? "<": "")),
        );
      },
    );
  }
}
