part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuestionGeneratedState extends QuizState {
  final Question question;
  const QuestionGeneratedState(this.question);
  @override
  List<Object> get props => [question];
}

class IsAnswerCorrectState extends QuizState {
  final int selectedIndex;
  const IsAnswerCorrectState(this.selectedIndex);
  @override
  List<Object> get props => [selectedIndex];
}

class IsAnswerWrongState extends QuizState {
  final int selectedIndex;
  const IsAnswerWrongState(this.selectedIndex);
  @override
  List<Object> get props => [selectedIndex];
}
