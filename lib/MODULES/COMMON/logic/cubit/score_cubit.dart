import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<int> {
  ScoreCubit() : super(0);

  void incrementScore() {
    emit(state + 1);
  }

  void resetScore() {
    emit(0);
  }

  // void decrement() {
  //   emit(state - 1);
  // }
}
