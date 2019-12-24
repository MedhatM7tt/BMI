import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label.toUpperCase(),
            style: kLabeltextSyle,
          ),
          SizedBox(
            height: 10.0,
          ),
          Icon(
            icon,
            size: 80.0,
          ),
        ],
      ),
    );
  }
}
