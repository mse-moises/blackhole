import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeConstant {
  static const pastelPallet = [
    Color(0x00fce9f1),
    Color(0x00e9fcf4),
    Color(0x00feece8),
    Color(0x00e8fafe),
    Color(0x00ece8fe),
  ];

  static Color getRandomPastelCollorBasedOnSeed(String seed) {
    int randomIndex = Random(seed.length).nextInt(pastelPallet.length);
    return pastelPallet[randomIndex];
  }

  static const smallSpace = 4.0;
  static const mediumSpace = 8.0;
  static const largeSpace = 16.0;

  static const extraLargeSpace = 32.0;

  static const borderRadiusButtonTag = 16.0;

  static const tagSelectorBoxWeight = 300.0;

  static const buttonBorderWidth = 2.0;

  static const thinBorderWidth = 1.0;

  static const moneySimpleText = TextStyle(
    fontSize: 20,
    color: Colors.black,
  );

  static const moneySimpleDecoration = InputDecoration(
    hintStyle: ThemeConstant.moneySimpleText,
    hintText: "00.00",
    border: InputBorder.none,
  );
}
