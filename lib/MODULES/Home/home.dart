import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quiz1/MODULES/COMMON/logic/cubit/score_cubit.dart';
import 'package:math_quiz1/MODULES/QUIZ/quiz_screen.dart';
import 'package:math_quiz1/MODULES/QUIZ/quiz_singleton.dart';

import '../../CONSTANTS/image_paths.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: myHeader(),
      body: structure(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Structure                               */
/* -------------------------------------------------------------------------- */

  structure() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePaths.spaceBg),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            einstienCard(),
            testYourSkillsHereText(),
            const SizedBox(height: 10),

            commonTile(
                1, 'Addition', 'Addition of two numbers', const QuizScreen()),
            commonTile(2, 'Subtraction', 'Subtraction of two numbers',
                const QuizScreen()),

            commonTile(3, 'Multiplication', 'Multiplcation of two numbers',
                const QuizScreen()),
            commonTile(
                4, 'Division', 'Division of two numbers', const QuizScreen()),
            // gradientTile(),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

  gradientTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        // height: 150,
        width: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(11)),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 106, 186, 0.349),
                Color.fromRGBO(128, 0, 255, 0.02),

                // Color(0xFFFF62B6),
                // Color(0xff8000FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subtraction',
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),

                //
                SizedBox(height: 5),

                Text(
                  "More modes coming soon",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffFF1F73),
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 15.0,
                  ),
                ),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  commonTile(int index, String title, String subtitle, navToScreen) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox(
        // height: 150,
        width: double.infinity,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 106, 186, 0.349),
                  Color.fromRGBO(128, 0, 255, 0.02),

                  // Color(0xFFFF62B6),
                  // Color(0xff8000FF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                      fontSize: 18.0,
                    ),
                  ),

                  //
                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xffFF1F73),
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      // fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      fontSize: 15.0,
                    ),
                  ),

                  //

                  playButton(index, navToScreen),
                ],
              ),
            )),
      ),
    );
  }

  playButton(int index, navToScreen) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<ScoreCubit>(context).resetScore();
          index == 1
              ? QuizSingleton.o.setType('addition')
              : index == 2
                  ? QuizSingleton.o.setType('subtraction')
                  : index == 3
                      ? QuizSingleton.o.setType('multiplication')
                      : index == 4
                          ? QuizSingleton.o.setType('division')
                          : QuizSingleton.o.setType('addition');

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return navToScreen;
          }));
        },
        child: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 255, 128, 170), Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Play',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  testYourSkillsHereText() {
    return const Padding(
      padding: EdgeInsets.only(top: 50.0, left: 20),
      child: Text(
        'Test your skills here',
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
        // textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "FontNameHere" ,
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 22.0,
        ),
      ),
    );
  }

  einstienCard() {
    return SizedBox(
      // height: 150,
      width: double.infinity,
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 24, 113, 0.58),
                Color.fromRGBO(128, 0, 255, 0.116),
                Color.fromRGBO(128, 0, 255, 0.116),

                // Color(0xFFFF62B6),
                // Color(0xff8000FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //@

              const Flexible(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Improve critical thinking',
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          // decoration: TextDecoration.none,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: "FontNameHere" ,
                          fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.w300,
                          fontSize: 22.0,
                        ),
                      ),

                      //
                      SizedBox(height: 10),

                      Text(
                        'Solving basic arithmetic improves critical thinking and problem-solving skills.',
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 206, 199, 255),
                          // decoration: TextDecoration.none,
                          // fontStyle: FontStyle.italic,
                          // fontFamily: "FontNameHere" ,
                          fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.w300,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //@

              Flexible(
                flex: 4,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/einstein1.jpg'),
                            fit: BoxFit.fill)),
                  ),
                ),
              )
            ],
          )),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ appbar                                 */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: const Text(
        'Home', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! Functionalities                            */
/* -------------------------------------------------------------------------- */

//
}
