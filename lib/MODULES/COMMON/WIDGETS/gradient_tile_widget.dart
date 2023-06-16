// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GradientTileWidget extends StatelessWidget {
  final Widget child;
  const GradientTileWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return gradientTile();
  }

  gradientTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
            padding: const EdgeInsets.symmetric(vertical: 75),
            child: child,
          ),
        ),
      ),
    );
  }
}
