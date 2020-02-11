import 'package:flutter/material.dart';

class RadioButtonCard<T> extends StatelessWidget {
  final ValueChanged<T> onSelected;
  final T value;
  final String visibleValue;
  final T selectedValue;
  final bool hasBuiltInDivider;

  const RadioButtonCard({
    Key key,
    this.onSelected,
    @required this.value,
    @required this.selectedValue,
    @required this.visibleValue,
    this.hasBuiltInDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelected(value);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: hasBuiltInDivider ? 3.0 : 1.0, color: Colors.grey),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                visibleValue,
                style: TextStyle(fontSize: 18),
              )),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: value == selectedValue ? Colors.green : Colors.white,
                    border: Border.all(
                        color: value != selectedValue
                            ? Colors.black
                            : Colors.green),
                    shape: BoxShape.circle),
                child: value == selectedValue
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
