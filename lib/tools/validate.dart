import 'package:blackhole/const/const_business_rules.dart';
import 'package:blackhole/models/tag_model.dart';
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

  //TODO VERIFICAR SE TEM MEMO Q TE VO PENSA
  static String? validateTagList(List<TagModel> tags){
    if(tags.isEmpty) return "Has to have some tag";
  }

  static String? validateTransactionType(TransactionTypes? transactionTypes){
    if(transactionTypes == null) return "Has to have a type";
  }
}
