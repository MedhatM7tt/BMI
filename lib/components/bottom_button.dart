import 'package:flutter/material.dart';

import 'package:bmi/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPressed, this.text});
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: kBottomButtonStyle,
          ),
        ),
        color: kActiveCardColor,
        width: double.infinity,
        height: 50.0,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
      onTap: onPressed,
    );
  }
}
