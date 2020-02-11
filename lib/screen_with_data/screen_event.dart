import 'package:equatable/equatable.dart';

abstract class ScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NextPressedEvent extends ScreenEvent {}

class SelectSubstanceEvent extends ScreenEvent {
  final String substance;

  SelectSubstanceEvent(this.substance);

  @override
  List<Object> get props => [substance];
}

class BackPressedEvent extends ScreenEvent {}
