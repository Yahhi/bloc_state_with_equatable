import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final IconData icon;
  final Color color;
  static const PADDING = 13.0;

  CustomButton({this.onTap, this.text, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: _width,
      child: RaisedButton(
        onPressed: onTap,
        padding: EdgeInsets.all(PADDING),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        color: color ?? Colors.green,
        disabledColor: Colors.green.withOpacity(0.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : SizedBox(),
            icon != null
                ? SizedBox(
                    width: 10,
                  )
                : SizedBox(),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: _width / 20,
                  letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
