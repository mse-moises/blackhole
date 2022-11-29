import 'package:blackhole/view/components/radio_button/bloc/radio_button_group_controller_bloc.dart';
import 'package:blackhole/view/components/radio_button/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButtonGroup extends StatelessWidget {
  RadioButtonGroup({
    Key? key,
    required this.radioButtonList,
    required this.controller,
  }) : super(key: key) {
    for (RadioButton radioButton in radioButtonList) {
      radioButton.setController(controller);
    }
  }
  final List<RadioButton> radioButtonList;
  final RadioButtonGroupControllerBloc controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: Row(
        children: radioButtonList,
      ),
    );
  }
}
