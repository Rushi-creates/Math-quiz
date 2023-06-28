import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/question.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
/* -------------------------------------------------------------------------- */
/*                              //@ declarations                              */
/* -------------------------------------------------------------------------- */

  int ans = 0;
  int num1 = 0;
  int num2 = 0;
  List<int> optionsList = [];
  Random random = Random();

/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

  QuizBloc()
      : super(QuestionGeneratedState(
          Question(
            num1: 0,
            num2: 0,
            answer: 0,
            options: [],
            type: 'initial',
          ),
        )) {
/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

    on<GenerateQuestionEvent>((event, emit) {
      Question question =
          //
          event.type == 'addition'
              ? addition()
              //
              : event.type == 'subtraction'
                  ? subtraction()
                  : event.type == 'multiplication'
                      ? multiplication()
                      : event.type == 'division'
                          ? division()
                          : addition();

      emit(QuestionGeneratedState(question));
    });

    on<OnAnswerSubmitEvent>((event, emit) {
      event.submittedAnswer == ans
          ? emit(IsAnswerCorrectState(event.selectedIndex))
          : emit(IsAnswerWrongState(event.selectedIndex));
    });
  }

/* -------------------------------------------------------------------------- */
/*                                //@ Addition                                */
/* -------------------------------------------------------------------------- */

  Question addition() {
    int generateRandomNumber() {
      final Random random = Random();
      return random.nextInt(100);
    }

    List<int> generateOptions(int answer, int length, int difference) {
      List<int> numbers = [];
      Random random = Random();

      while (numbers.length < length) {
        int offset = random.nextInt(difference * 2 + 1) - difference;
        int number = answer + offset;

        if (!numbers.contains(number) && number != answer) {
          numbers.add(number);
        }
      }

      numbers.insert(random.nextInt(length), answer);
      print(numbers);
      return numbers;
    }

    num1 = generateRandomNumber();
    num2 = generateRandomNumber();
    ans = num1 + num2;
    optionsList = generateOptions(ans, 5, 10);

    return Question(
        num1: num1,
        num2: num2,
        answer: ans,
        options: optionsList,
        type: 'addition');
  }

/* -------------------------------------------------------------------------- */
/*                               //@ subtraction                              */
/* -------------------------------------------------------------------------- */

  Question subtraction() {
    // clear previous
    ans = 0;
    num1 = 0;
    num2 = 0;
    optionsList = [];

    //delarations
    int min = 1; // Minimum value for the second number
    int max = 100; // Maximum value for both numbers
    int minDifference = 9;

    num2 = min + random.nextInt(max - min + 1);
    num1 =
        num2 + minDifference + random.nextInt(max - num2 - (minDifference - 1));
    ans = num1 - num2;

    //private helper
    List<int> generateOptions(int answer, int length, int difference) {
      List<int> numbers = [];
      Random random = Random();

      while (numbers.length < length) {
        int offset = random.nextInt(difference * 2 + 1) - difference;
        int number = answer + offset;

        if (!numbers.contains(number) && number != answer) {
          numbers.add(number);
        }
      }

      numbers.insert(random.nextInt(length), answer);
      print(numbers);
      return numbers;
    }

    optionsList = generateOptions(ans, 5, 10);

    return Question(
        num1: num1,
        num2: num2,
        answer: ans,
        options: optionsList,
        type: 'subtraction');
  }
/* -------------------------------------------------------------------------- */
/*                                //@ Multiplication                                */
/* -------------------------------------------------------------------------- */

  Question multiplication() {
    List<int> generateOptions(int answer, int length, int difference) {
      List<int> numbers = [];
      Random random = Random();

      while (numbers.length < length) {
        int offset = random.nextInt(difference * 2 + 1) - difference;
        int number = answer + offset;

        if (!numbers.contains(number) && number != answer) {
          numbers.add(number);
        }
      }

      numbers.insert(random.nextInt(length), answer);
      print(numbers);
      return numbers;
    }

    num1 = random.nextInt(22);
    num2 = random.nextInt(20) + 4;
    ans = num1 * num2;
    optionsList = generateOptions(ans, 5, 10);

    return Question(
        num1: num1,
        num2: num2,
        answer: ans,
        options: optionsList,
        type: 'multiplication');
  }

/* -------------------------------------------------------------------------- */
/*                                //@ Division                                */
/* -------------------------------------------------------------------------- */

  Question division() {
    List<int> generateOptions(
        int dividend, int divisor, int length, int difference) {
      List<int> numbers = [];
      Random random = Random();

      while (numbers.length < length) {
        int offset = random.nextInt(difference * 2 + 1) - difference;
        int option = dividend ~/ divisor + offset;

        if (!numbers.contains(option) && option != dividend ~/ divisor) {
          numbers.add(option);
        }
      }

      numbers.insert(random.nextInt(length), dividend ~/ divisor);
      print(numbers);
      return numbers;
    }

    int num2 = (Random().nextInt(10) + 2) * 2; // Generate an even divisor
    int num1 =
        num2 * Random().nextInt(20); // Generate a dividend divisible by num2
    ans = num1 ~/ num2;
    List<int> optionsList = generateOptions(num1, num2, 5, 10);

    return Question(
      num1: num1,
      num2: num2,
      answer: ans,
      options: optionsList,
      type: 'division',
    );
  }
}
