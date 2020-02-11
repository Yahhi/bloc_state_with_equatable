import 'package:bloc_state_with_equatable/screen_with_data/form_owner.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_bloc.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenState();
  }
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScreenBloc>(
        create: (context) => ScreenBloc(),
        child: BlocListener<ScreenBloc, ScreenState>(
          listener: (ctxt, state) {
            print("state is now $state");
            if (state is ReturnState || state is FinishedState) {
              Navigator.of(context).pop();
            }
          },
          child: FormOwner(),
        ));
  }
}
