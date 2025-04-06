import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';



class CalculatorBrain {
  num? height;
  int? weight;
  late final double _bmi = weight! / pow(height! / 100, 2);

  CalculatorBrain({this.height, this.weight, });

  String calculateBMI() {
    return _bmi.toStringAsFixed(1);
  }

  

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.25 && _bmi < 25) {
      return 'NORMAL';
    } else {
      return 'LIGHTWEIGHT';
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return 'You have a overwight is too difficult to carry you and if you are woman I am feeling you husbands smile';
    } else if (_bmi >= 18.25) {
      return 'Great job! Your BMI indicates that your weight is within the normal range for your height. This suggests that you have a healthy balance, which is excellent for your overall well-being.';
    } else {
      return 'Your BMI indicates that you are underweight, which means your body weight is below the recommended range for your height. ';
    }
  }
  

  
}
