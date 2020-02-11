import 'package:bloc_state_with_equatable/screen_with_data/screen_bloc.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_event.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_state.dart';
import 'package:bloc_state_with_equatable/screen_with_data/some_information_page.dart';
import 'package:bloc_state_with_equatable/screen_with_data/widget/top_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_with_radio_page.dart';

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
          child: BlocBuilder<ScreenBloc, ScreenState>(
                  condition: _statesNotSameType,
                  builder: (context, state) {
                    return buildWidget(context, state);
                  }
          )
        ));
  }

  Widget buildWidget(BuildContext context, ScreenState state) {
    String appBarTitle = "SECOND";
    
    if (state is FirstPageState) appBarTitle = "FIRST";
    if (state is SavingState) appBarTitle = "PROGRESS";

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
                title: Text(appBarTitle)
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: TopIndicators(state.stepsHighlighted)
              ),
             
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: buildInside(context, state)
        ),
      ),
    );
  }
  buildInside(context, state){
    if (state is FirstPageState) return FormWithRadioPage();
    if (state is SavingState)
      return Center(
        child: CircularProgressIndicator(),
      );
    if (state is ErrorState) _showError(context, state.error);
    return SomeInformationPage();
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
