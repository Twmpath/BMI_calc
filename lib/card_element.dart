import 'package:flutter/material.dart';
import 'constants.dart';

class CardElement extends StatelessWidget {
  CardElement({this.colour= const Color(kActiveCardColour), this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(20.0)
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
