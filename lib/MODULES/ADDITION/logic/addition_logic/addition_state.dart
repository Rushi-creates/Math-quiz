part of 'addition_bloc.dart';

abstract class AdditionState extends Equatable {
  @override
  List<Object> get props => [];
}

class AdditionInitialState extends AdditionState {}

class IsAdditionAnswerCorrect extends AdditionState {
  // final int num1;
  // final int num2;
  // final int sum;
  // final List<int> optionList;
  // IsAdditionAnswerCorrect(this.num1, this.num2, this.sum, this.optionList);
  // @override
  // List<Object> get props => [num1, num2, sum, optionList];
}

class IsAdditionAnswerWrong extends AdditionState {
  // final int num1;
  // final int num2;
  // final int sum;
  // final List<int> optionList;
  // IsAdditionAnswerWrong(this.num1, this.num2, this.sum, this.optionList);
  // @override
  // List<Object> get props => [num1, num2, sum, optionList];
}
