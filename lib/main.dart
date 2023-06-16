import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'MODULES/ADDITION/logic/addition_logic/addition_bloc.dart';
import 'MODULES/Home/ui/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdditionBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
