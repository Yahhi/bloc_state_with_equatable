import 'package:flutter/material.dart';

import 'indicator.dart';

class TopIndicators extends StatelessWidget {
  final int highlightedNumber;

  const TopIndicators(
    this.highlightedNumber, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Indicator(highlightedNumber >= 1),
        SizedBox(
          width: 5,
        ),
        Indicator(highlightedNumber >= 2),
      ],
    );
  }
}
