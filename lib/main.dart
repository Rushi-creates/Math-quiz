import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quiz1/MODULES/COMMON/logic/cubit/score_cubit.dart';
import 'package:math_quiz1/MODULES/QUIZ/bloc/quiz_bloc.dart';
import 'package:math_quiz1/MODULES/SPLASH/splash_screen.dart';

import 'MODULES/Home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //@ CUBIT
        BlocProvider(create: (context) => ScoreCubit()),

        //@ BLOCS
        BlocProvider(create: (context) => QuizBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
