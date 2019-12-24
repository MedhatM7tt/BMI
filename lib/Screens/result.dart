import 'package:bmi/components/custom_card.dart';
import 'package:bmi/result_args.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/components/bottom_button.dart';

class Result extends StatelessWidget {
  static const routName = 'Result';

  @override
  Widget build(BuildContext context) {
    final ResultArgs resultArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(kBarTitle),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kBigtextSyle,
                ),
                alignment: Alignment.bottomLeft,
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomCard(
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultArgs.bmiTitle,
                      style: kBMITitleStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      resultArgs.bmiResult,
                      style: kBMINumberStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      resultArgs.bmiConculsion,
                      style: kNumberStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Re-Calculate',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
