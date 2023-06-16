import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_quiz1/MODULES/COMMON/WIDGETS/gradient_tile_widget.dart';

import '../logic/addition_logic/addition_bloc.dart';

class AdditionScreen extends StatefulWidget {
  const AdditionScreen({super.key});

  @override
  State<AdditionScreen> createState() => _AdditionScreenState();
}

class _AdditionScreenState extends State<AdditionScreen> {
/* -------------------------------------------------------------------------- */
/*                               //! Declarations                              */
/* -------------------------------------------------------------------------- */

//

/* -------------------------------------------------------------------------- */
/*                                //! lifecycle                               */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdditionBloc>(context)
        .add(AgainGenerateTwoRandomNumbersEvent());
  }

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
      // floatingActionButton: myFab(),
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
            image: AssetImage('assets/images/spacebg.png'), fit: BoxFit.fill),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              GradientTileWidget(child: displayQuestion()),
              const SizedBox(height: 30),
              GradientTileWidget(child: displayOptionList()),
              const SizedBox(height: 10),

              Align(
                child: optionTileStates(),
              ),
            ],
          ),
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! States                                 */
/* -------------------------------------------------------------------------- */

  optionTileStates() {
    return BlocBuilder<AdditionBloc, AdditionState>(
      builder: (context, state) {
        if (state is IsAdditionAnswerWrong) {
          return dipslayanswer('Wrong');
        } else if (state is IsAdditionAnswerCorrect) {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            BlocProvider.of<AdditionBloc>(context)
                .add(AgainGenerateTwoRandomNumbersEvent());
          });
          return dipslayanswer('Right');
        }
        return const Text('');
      },
    );
  }

  testOptionTile(singleObj) {
    return BlocBuilder<AdditionBloc, AdditionState>(
      builder: (context, state) {
        //
        if (state is IsAdditionAnswerWrong) {
          return optionTile(singleObj);
        }

        //
        else if (state is IsAdditionAnswerCorrect) {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            BlocProvider.of<AdditionBloc>(context)
                .add(AgainGenerateTwoRandomNumbersEvent());
          });
          return optionTile(singleObj);
        }

        //
        return optionTile(singleObj);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

  dipslayanswer(String text) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    ));
  }

  backButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const CircleAvatar(
          backgroundColor: Color.fromARGB(36, 92, 92, 92),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }

  displayOptionList() {
    List list = context.watch<AdditionBloc>().options;
    return SizedBox(
      height: 120,
      child: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, i) {
            return optionTile(list[i]);
          },
        ),
      ),
    );
  }

  displayQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        numberTile(context.watch<AdditionBloc>().num1),
        const SizedBox(width: 15),
        const Text(
          '+',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 15),
        numberTile(context.watch<AdditionBloc>().num2),
        const SizedBox(width: 15),
        const Text(
          '=',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 15),
        numberTile('?'),
        //
      ],
    );
  }

  numberTile(var num) {
    return SizedBox(
      width: 50,
      height: 50,
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
    );
  }

  optionTile(int submittedAns) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AdditionBloc>(context)
            .add(OnSumbitAdditionEvent(submittedAns));
      },
      child: Center(
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                // fontSize: 20.0,
              ),
            ),
          ),
        )),
      ),
    );
  }

  // myFab() {
  //   return FloatingActionButton(
  //     backgroundColor: Colors.purple,
  //     // tooltip: "Hint text on hover ",
  //     onPressed: () {
  //       BlocProvider.of<AdditionBloc>(context)
  //           .add(AgainGenerateTwoRandomNumbersEvent());
  //     },
  //     child: const Icon(Icons.add),
  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                                 //@ appbar                                 */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      // elevation: 0.0,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      // title: const Text(
      //   'Home', //give here appBar title
      //   style: TextStyle(color: Colors.black
      //       // fontWeight: FontWeight.bold
      //       // fontSize: 15,
      //       ),
      // ),
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
