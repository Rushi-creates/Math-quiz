import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quiz1/MODULES/COMMON/WIDGETS/gradient_pink_button_widget.dart';
import 'package:math_quiz1/MODULES/Home/home.dart';

import '../../CONSTANTS/image_paths.dart';
import '../COMMON/logic/cubit/score_cubit.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
/* -------------------------------------------------------------------------- */
/*                               //! Declarations                              */
/* -------------------------------------------------------------------------- */

//

/* -------------------------------------------------------------------------- */
/*                                  //! Build                                 */
/* -------------------------------------------------------------------------- */

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
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ScoreCubit, int>(
                builder: (context, state) {
                  return Text(
                    'Your Score: $state',
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
                      fontSize: 25.0,
                    ),
                  );
                },
              ),
              const GradientPinkButtonWidget(
                navToScreen: Home(),
                text: 'Go back home',
                isPushReplaced: true,
              )
            ],
          ),
        ),
      ),
    );
  }
/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

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
        'Results', //give here appBar title
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
