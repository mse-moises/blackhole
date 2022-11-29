import 'package:blackhole/const/const_business_rules.dart';
import 'package:blackhole/tools/converters.dart';
import 'package:flutter/material.dart';

class Validator {
  static bool isFormValid(GlobalKey<FormState> key) {
    return key.currentState?.validate() ?? false;
  }

  static String? validateObservationForm(String? observation) {
    if ((observation?.length ?? 0) > ConstBusinessRules.observationMaxLenght) {
      return "Observation can't have more then 255 characters";
    }
    return null;
  }

  static String? validateMoneyForm(String? _value) {
    double value = Converters.moneyStringToDouble(_value ?? "");
    if (value <= 0) return "Invalid value";
    return null;
  }
}
