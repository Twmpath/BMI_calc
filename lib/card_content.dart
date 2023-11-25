import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  CardContent({this.icon, this.iconText=""});

  final IconData? icon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            icon,
            size:kIconSize,
        ),
        SizedBox(
          height: kSpacingBox,
        ),
        Text(iconText, style: kLabelTextStyle,
        ),
      ],
    );
  }
}

