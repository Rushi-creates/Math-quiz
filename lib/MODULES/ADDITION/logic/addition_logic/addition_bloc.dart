import 'package:equatable/equatable.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'addition_event.dart';
part 'addition_state.dart';

class AdditionBloc extends Bloc<AdditionEvent, AdditionState> {
  //
  int num1 = 0;
  int num2 = 0;
  int sum = 0;
  List<int> options = [];

  AdditionBloc() : super(AdditionInitialState()) {
    //

    // num1 = _generateRandomNumber();
    // num2 = _generateRandomNumber();
    // sum = num1 + num2;
    // options = generateOptions(sum, 5, 10);
/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

    on<AgainGenerateTwoRandomNumbersEvent>((event, emit) {
      num1 = _generateRandomNumber();
      num2 = _generateRandomNumber();
      sum = num1 + num2;
      options = generateOptions(sum, 5, 10);
      emit(AdditionInitialState());
    });

/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

    on<OnSumbitAdditionEvent>((event, emit) {
      event.submittedAnswer == sum
          ? emit(IsAdditionAnswerCorrect())
          : emit(IsAdditionAnswerWrong());
    });
  }

/* -------------------------------------------------------------------------- */
/*                            // @ helper function                            */
/* -------------------------------------------------------------------------- */

  int _generateRandomNumber() {
    final Random random = Random();
    return random.nextInt(100);
  }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

// more greater the 'difference arg' more the different the options from actual answer
  // List<int> generateOptions(int answer, int length, int difference) {
  //   List<int> numbers = [];
  //   Random random = Random();

  //   for (int i = 0; i < length; i++) {
  //     if (i == random.nextInt(length)) {
  //       numbers.add(answer);
  //     } else {
  //       int offset = random.nextInt(difference * 2 + 1) - difference;
  //       int number = answer + offset;
  //       numbers.add(number);
  //     }
  //   }

  //   return numbers;
  // }

  // List<int> generateOptions(int answer, int length, int difference) {
  //   List<int> numbers = [];
  //   Set<int> generatedNumbers = Set();
  //   Random random = Random();

  //   while (numbers.length < length) {
  //     if (numbers.length == random.nextInt(length)) {
  //       numbers.add(answer);
  //     } else {
  //       int offset = random.nextInt(difference * 2 + 1) - difference;
  //       int number = answer + offset;

  //       if (!generatedNumbers.contains(number)) {
  //         numbers.add(number);
  //         generatedNumbers.add(number);
  //       }
  //     }
  //   }

  //   return numbers;
  // }
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
}
