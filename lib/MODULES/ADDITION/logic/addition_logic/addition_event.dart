part of 'addition_bloc.dart';

abstract class AdditionEvent extends Equatable {
  const AdditionEvent();

  @override
  List<Object> get props => [];
}

class OnSumbitAdditionEvent extends AdditionEvent {
  final int submittedAnswer;
  // final int actualAnswer;
  const OnSumbitAdditionEvent(
    this.submittedAnswer,
    // this.actualAnswer,
  );
  @override
  List<Object> get props => [
        submittedAnswer,
        // actualAnswer,
      ];
}

class AgainGenerateTwoRandomNumbersEvent extends AdditionEvent {}
