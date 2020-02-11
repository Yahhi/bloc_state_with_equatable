import 'package:bloc_state_with_equatable/screen_with_data/screen_bloc.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_event.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/custom_button.dart';
import 'widget/radio_button_card.dart';

class FormWithRadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormWithRadioPageState();
  }
}

class _FormWithRadioPageState extends State<FormWithRadioPage> {
  static const _LIST = [
    "one",
    "two",
    "three",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<ScreenBloc, ScreenState>(
              condition: _allEvents,
              builder: (context, state) {
                print("rebuild list with ${state.selection}");
                final String selected = state.selection;
                List<Widget> radioButtons = _LIST.map((value) {
                  return RadioButtonCard<String>(
                    onSelected: _changeValueTo,
                    value: value,
                    visibleValue: value,
                    selectedValue: selected,
                  );
                }).toList();
                return Column(
                  children: radioButtons,
                );
              },
            ),
          ),
        ),
        CustomButton(
          onTap: () {
            BlocProvider.of<ScreenBloc>(context).add(NextPressedEvent());
          },
          text: "NEXT",
        ),
      ],
    );
  }

  void _changeValueTo(String value) {
    BlocProvider.of<ScreenBloc>(context).add(SelectSubstanceEvent(value));
  }

  bool _allEvents(ScreenState previous, ScreenState current) {
    return true;
  }
}
