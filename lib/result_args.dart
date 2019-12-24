import 'package:flutter/material.dart';

class ResultArgs {
  final String bmiTitle;
  final String bmiResult;
  final String bmiConculsion;

  ResultArgs(
      {@required this.bmiConculsion,
      @required this.bmiResult,
      @required this.bmiTitle});
}
