import 'package:flutter/material.dart';
import 'Screens/homeScreen.dart';
import 'Screens/result.dart';
import 'package:bmi/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kBarTitle,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFffffff),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.blue[200],
          inactiveTrackColor: Colors.grey,
          overlayColor: Colors.blue[200],
          thumbColor: Colors.blueAccent,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 10.0,
          ),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: TextTheme().copyWith(
          body1: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Colors.black,
        ),
        primaryColor: Color(0xFFfc034e),
        scaffoldBackgroundColor: Color(0xFF787a7a),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.red[200],
          inactiveTrackColor: Colors.grey,
          overlayColor: Colors.red[200],
          thumbColor: Colors.redAccent,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 10.0,
          ),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
        ),
      ),
      initialRoute: 'Home',
      routes: {
        'Home': (context) => HomeScreen(),
        Result.routName: (context) => Result(),
      },
    );
  }
}
