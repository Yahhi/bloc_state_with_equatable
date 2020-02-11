import 'package:bloc_state_with_equatable/screen_with_data/screen_bloc.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_event.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_state.dart';
import 'package:bloc_state_with_equatable/screen_with_data/some_information_page.dart';
import 'package:bloc_state_with_equatable/screen_with_data/widget/top_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_with_radio_page.dart';

class FormOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _sendReturnEvent(BlocProvider.of<ScreenBloc>(context));
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Column(
            children: <Widget>[
              AppBar(
                centerTitle: true,
                title: BlocBuilder<ScreenBloc, ScreenState>(
                  condition: _statesNotSameType,
                  builder: (context, state) {
                    if (state is FirstPageState) return Text("FIRST");
                    if (state is SavingState) return Text("PROGRESS");
                    return Text("SECOND");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: BlocBuilder<ScreenBloc, ScreenState>(
                    condition: _statesNotSameType,
                    builder: (context, state) {
                      return TopIndicators(state.stepsHighlighted);
                    }),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: BlocBuilder<ScreenBloc, ScreenState>(
            condition: _statesNotSameType,
            builder: (context, state) {
              if (state is FirstPageState) return FormWithRadioPage();
              if (state is SavingState)
                return Center(
                  child: CircularProgressIndicator(),
                );
              if (state is ErrorState) _showError(context, state.error);
              return SomeInformationPage();
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _sendReturnEvent(ScreenBloc bloc) {
    print("back android action");
    bloc.add(BackPressedEvent());
    return Future.value(false);
  }

  bool _statesNotSameType(ScreenState previous, ScreenState current) {
    return previous.runtimeType != current.runtimeType;
  }

  void _showError(BuildContext context, String error) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 60.0,
            alignment: Alignment.center,
            child: Text(error),
          );
        });
  }
}
