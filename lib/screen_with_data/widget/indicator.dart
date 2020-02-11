import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isSelected;

  const Indicator(
    this.isSelected, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 4.0,
        //width: _width / 10,
        decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}
