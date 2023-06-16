import 'package:flutter/material.dart';
import 'package:math_quiz1/MODULES/ADDITION/ui/addition_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/spacebg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            einstienCard(),
            testYourSkillsHereText(),
            addTile(),
            gradientTile(),
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

  addTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                  const Text(
                    'Addition',
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
                  const SizedBox(height: 5),

                  const Text(
                    "Addiiton of two number.",
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

                  playButton(),
                ],
              ),
            )),
      ),
    );
  }

  playButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AdditionScreen();
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
