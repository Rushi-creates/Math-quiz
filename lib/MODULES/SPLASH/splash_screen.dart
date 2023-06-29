import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:math_quiz1/MODULES/Home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
/* -------------------------------------------------------------------------- */
/*                               //! Declarations                              */
/* -------------------------------------------------------------------------- */

//

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    });
  }
/* -------------------------------------------------------------------------- */
/*                                  //! Build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      // appBar: myHeader(),
      body: structure(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Structure                               */
/* -------------------------------------------------------------------------- */

  structure() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(189, 21, 85, 0.576),
            Color.fromRGBO(128, 0, 255, 0.116),
            Color.fromRGBO(128, 0, 255, 0.116),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.beat(
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 30),
            const Text(
              'Math Quiz',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
        'Splash', //give here appBar title
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
