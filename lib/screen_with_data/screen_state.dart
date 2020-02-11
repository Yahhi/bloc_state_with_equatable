import 'package:equatable/equatable.dart';

abstract class ScreenState extends Equatable {
  final int stepsHighlighted;
  final String selection;

  ScreenState(this.stepsHighlighted, this.selection);

  List<Object> get props => [stepsHighlighted, selection];
}

class FirstPageState extends ScreenState {
  FirstPageState(String selection) : super(1, selection);
}

class SecondPageState extends ScreenState {
  SecondPageState(String selection) : super(2, selection);
}

class FinishedState extends ScreenState {
  FinishedState(String selection) : super(2, selection);
}

class SavingState extends ScreenState {
  SavingState(String selection) : super(2, selection);
}

class ReturnState extends ScreenState {
  ReturnState(String selection) : super(1, null);
}

class ErrorState extends ScreenState {
  final String error;
  ErrorState(this.error, String selection) : super(2, selection);
}
