import 'package:blackhole/const/const_business_rules.dart';
import 'package:blackhole/const/const_theme.dart';
import 'package:blackhole/view/components/radio_button/bloc/radio_button_group_controller_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButton extends StatelessWidget {
  RadioButton({
    Key? key,
    required this.title,
    required this.value,
    required 
  }) : super(key: key);

  late final RadioButtonGroupControllerBloc blocController;
  final String title;
  final Enum value;

  bool isSelected = false;

  void setIsSelected(bool _isSelected) {
    isSelected = _isSelected;
  }

  void setController(RadioButtonGroupControllerBloc _blocController) {
    blocController = _blocController;
  }

  
  BorderSide getBorder(BuildContext context) {
    //if(!isSelected) return BorderSide.none;
    return BorderSide(
      color: isSelected? Theme.of(context).primaryColor : Colors.grey,
      width:  ThemeConstant.buttonBorderWidth ,
    );
  }

  setRadioValue() {
    blocController.add(
      RadioButtonSelect(value: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonGroupControllerBloc,
        RadioButtonGroupControllerState>(
      builder: (context, state) {
        if (state is RadioButtonGroupControllerSelected) {
          setIsSelected(state.value == value);
        }

        return TextButton(
          onPressed: setRadioValue,
          style: TextButton.styleFrom(
            side: getBorder(context),
          ),
          child: Text(title),
        );
      },
    );
  }
}
