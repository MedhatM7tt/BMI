import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.child, @required this.color, this.onPress});

  final Widget child;
  final Function onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(15.0),
        child: child,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
      ),
      onTap: onPress,
    );
  }
}
