import 'package:flutter/material.dart';

extension DoubleExtension on double {
  Widget heightSizedBox() {
    return SizedBox(height: this);
  }
  Widget widthSizedBox() {
    return SizedBox(width: this);
  }
}

extension IntegerExtension on int {

  Widget get height =>  SizedBox(height: toDouble());
  Widget get width =>  SizedBox(width: toDouble());
}