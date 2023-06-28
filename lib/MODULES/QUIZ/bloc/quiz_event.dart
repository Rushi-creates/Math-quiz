part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class GenerateQuestionEvent extends QuizEvent {
  final String type;
  const GenerateQuestionEvent(this.type);
  @override
  List<Object> get props => [type];
}

class OnAnswerSubmitEvent extends QuizEvent {
  final int selectedIndex;
  final int submittedAnswer;
  const OnAnswerSubmitEvent(
    this.selectedIndex,
    this.submittedAnswer,
  );
  @override
  List<Object> get props => [submittedAnswer, selectedIndex];
}
