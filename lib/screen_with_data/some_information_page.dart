import 'package:bloc_state_with_equatable/screen_with_data/screen_event.dart';
import 'package:bloc_state_with_equatable/screen_with_data/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen_bloc.dart';

class SomeInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text("some information text here"),
          ),
        ),
        CustomButton(
          onTap: () {
            BlocProvider.of<ScreenBloc>(context).add(NextPressedEvent());
          },
          text: "NEXT",
        )
      ],
    );
  }
}
