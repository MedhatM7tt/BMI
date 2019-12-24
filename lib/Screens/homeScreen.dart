import 'package:bmi/Screens/result.dart';
import 'package:bmi/bmi_calculations.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/result_args.dart';
import 'package:flutter/material.dart';
import 'package:bmi/components/custom_card.dart';
import 'package:bmi/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/components/round_icon_button.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Gender selectedGender;
double hieght = 160;
int age = 22, weight = 50;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kBarTitle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    child: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: 'Male',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: 'Female',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'hieght'.toUpperCase(),
                    style: kLabeltextSyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        hieght.toStringAsFixed(2),
                        style: kSliderNumberStyle,
                      ),
                      Text(
                        'cm'.toUpperCase(),
                        style: kLabeltextSyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: hieght,
                    min: 100,
                    max: 250,
                    onChanged: (double _hieght) {
                      setState(() {
                        hieght = _hieght;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'wieght'.toUpperCase(),
                          style: kLabeltextSyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icons.add,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'age'.toUpperCase(),
                          style: kLabeltextSyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              onPressed: () {
                if (selectedGender != null) {
                  AudioCache audioCache = AudioCache();
                  audioCache.play('calculate.mp3');
                  BMICalculations bmiCalculations =
                      BMICalculations(height: hieght, weight: weight);

                  Navigator.pushNamed(
                    context,
                    Result.routName,
                    arguments: ResultArgs(
                      bmiResult: bmiCalculations.getBMIResult(),
                      bmiTitle: bmiCalculations.getBMITitle(),
                      bmiConculsion: bmiCalculations.getBMIConclusion(),
                    ),
                  );
                } else {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Miss Gender",
                    desc: "Please Choose Gender!",
                    style: AlertStyle(
                      backgroundColor: Colors.grey,
                    ),
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Okay",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.redAccent
                            : Colors.blueAccent,
                      )
                    ],
                  ).show();
                }
              },
              text: 'calculate',
            ),
          )
        ],
      ),
    );
  }
}
