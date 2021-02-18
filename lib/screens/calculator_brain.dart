import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = (weight / pow(height, 2))*703;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25){
      return 'Keep eating this amount and you\'ll be eligible for a Covid vaccine.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Does it feel normal?';
    } else {
      return 'Your BMIX result is perhaps low and may indicate that you should eat more or exercise less.  Please consult your physician before making any major changes to your lifestyle.';
    }
  }

  String getInterpretation() {

    if(_bmi >= 25){
      return 'Covid Vaccine Eligible';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}