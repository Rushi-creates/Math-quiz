// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:advance_animated_progress_indicator/advance_animated_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quiz1/MODULES/COMMON/logic/cubit/score_cubit.dart';

import 'package:math_quiz1/MODULES/QUIZ/bloc/quiz_bloc.dart';
import 'package:math_quiz1/MODULES/QUIZ/quiz_singleton.dart';
import 'package:math_quiz1/MODULES/RESULTS/results_screen.dart';

import '../../CONSTANTS/image_paths.dart';
import '../COMMON/WIDGETS/gradient_tile_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizBloc>(context)
        .add(GenerateQuestionEvent(QuizSingleton.o.type));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _Structure(),
    );
  }
}
/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

class _Structure extends StatelessWidget {
  const _Structure();

  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                                //@ listener                                */
/* -------------------------------------------------------------------------- */

    return BlocListener<ScoreCubit, int>(
        listener: (context, scoreState) {
          if (scoreState > 9) {
            Future.delayed(Duration(seconds: 1), () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const ResultsScreen();
              }));
            });
          }
        },
        child: BlocListener<QuizBloc, QuizState>(
          listener: (context, state) {
            if (state is IsAnswerCorrectState) {
              BlocProvider.of<ScoreCubit>(context).incrementScore();
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                BlocProvider.of<QuizBloc>(context)
                    .add(GenerateQuestionEvent(QuizSingleton.o.type));
              });
            }
          },

          /* -------------------------------------------------------------------------- */
          /*                                     //@                                    */
          /* -------------------------------------------------------------------------- */

          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                  image: AssetImage(ImagePaths.spaceBg), fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _CustomHeader(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    const GradientTileWidget(child: _DisplayQuestion()),
                    const SizedBox(height: 30),
                    const GradientTileWidget(child: _DisplayOptionsList()),
                    const SizedBox(height: 20),
                    _Loader(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _Loader extends StatelessWidget {
  const _Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScoreCubit, int>(
      builder: (context, count) {
        print(count);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: AnimatedLinearProgressIndicator(
            indicatorColor: Colors.white,
            percentage: count / 10,
            animationDuration: const Duration(seconds: 1),
            label: '',
            indicatorBackgroundColor: Color.fromARGB(255, 174, 147, 185),
            labelStyle: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

class _CustomHeader extends StatelessWidget {
  const _CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(36, 92, 92, 92),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          QuizSingleton.o.type == 'addition'
              ? 'Addition'
              : QuizSingleton.o.type == 'subtraction'
                  ? 'Subtraction'
                  : QuizSingleton.o.type == 'multiplication'
                      ? 'Multiplication'
                      : QuizSingleton.o.type == 'division'
                          ? 'Division'
                          : '',
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 22.0,
          ),
        ),
        const Spacer(),
        BlocBuilder<ScoreCubit, int>(
          builder: (context, count) {
            return Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Text(
                '$count/10',
                style: const TextStyle(
                  color: Colors.white,
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _DisplayOptionsList extends StatelessWidget {
  const _DisplayOptionsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      buildWhen: (previous, current) => (current is QuestionGeneratedState),
      builder: (context, state) {
        if (state is QuestionGeneratedState) {
          return SizedBox(
            height: 150,
            child: Center(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.question.options.length,
                itemBuilder: (context, i) {
                  return _OptionTile(
                    index: i,
                    submittedAns: state.question.options[i],
                  );
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class _OptionTile extends StatelessWidget {
  final int index;
  final int submittedAns;

  const _OptionTile({
    required this.index,
    required this.submittedAns,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;

    return GestureDetector(
      onTap: () {
        BlocProvider.of<QuizBloc>(context)
            .add(OnAnswerSubmitEvent(index, submittedAns));
      },
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is IsAnswerCorrectState) {
            color = state.selectedIndex == index ? Colors.green : Colors.white;
          } else if (state is IsAnswerWrongState) {
            color = state.selectedIndex == index ? Colors.red : Colors.white;
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Card(
                      color: color,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: FittedBox(
                          child: Text(
                            submittedAns.toString(),
                            // maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                            // textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              // decoration: TextDecoration.none,
                              // fontStyle: FontStyle.italic,
                              // fontFamily: "FontNameHere" ,
                              // fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.w300,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DisplayQuestion extends StatelessWidget {
  const _DisplayQuestion();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      buildWhen: (previous, current) => (current is QuestionGeneratedState),
      builder: (context, state) {
        if (state is QuestionGeneratedState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _QuestionNumberTile(num: state.question.num1),
              const SizedBox(width: 15),
              Text(
                QuizSingleton.o.type == 'addition'
                    ? '+'
                    : QuizSingleton.o.type == 'subtraction'
                        ? '-'
                        : QuizSingleton.o.type == 'multiplication'
                            ? 'x'
                            : QuizSingleton.o.type == 'division'
                                ? '/'
                                : '+',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 15),
              _QuestionNumberTile(num: state.question.num2),
              const SizedBox(width: 15),
              const Text(
                '=',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 15),
              const _QuestionNumberTile(num: '?'),
              //
            ],
          );
        }
        return Container();
      },
    );
  }
}

class _QuestionNumberTile extends StatelessWidget {
  final dynamic num;
  const _QuestionNumberTile({required this.num});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              num == null ? ' ' : num.toString(),
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                // fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                // fontSize: 20.0,
              ),
            ),
          ),
        )),
      ),
    );
  }
}
