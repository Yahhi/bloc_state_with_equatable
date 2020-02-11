import 'package:bloc_state_with_equatable/screen_with_data/screen_event.dart';
import 'package:bloc_state_with_equatable/screen_with_data/screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  String value;

  ScreenBloc({this.value});

  @override
  ScreenState get initialState => FirstPageState(value);

  @override
  Stream<ScreenState> mapEventToState(ScreenEvent event) async* {
    if (event is NextPressedEvent) {
      if (state is FirstPageState) {
        yield SecondPageState(value);
      } else if (state is SecondPageState) {
        yield SavingState(value);
        await Future.delayed(
            Duration(milliseconds: 300)); //a time consuming operation here
        yield FinishedState(value);
      }
    } else if (event is BackPressedEvent) {
      print("BackPressedEvent. State is $state");
      if (state is FirstPageState) {
        yield ReturnState(value);
      } else if (state is SecondPageState) {
        yield FirstPageState(value);
      } else if (state is SavingState) {
        yield FirstPageState(value);
      }
    } else if (event is SelectSubstanceEvent) {
      print("event happened!");
      value = event.substance;
      yield FirstPageState(value);
    }
  }
}
