import 'package:flutter/material.dart';

class GradientPinkButtonWidget extends StatelessWidget {
  final dynamic navToScreen;
  final String text;
  final bool isPushReplaced;
  const GradientPinkButtonWidget({
    super.key,
    required this.navToScreen,
    required this.text,
    this.isPushReplaced = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: GestureDetector(
        onTap: () {
          isPushReplaced
              ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return navToScreen;
                }))
              : Navigator.push(context, MaterialPageRoute(builder: (context) {
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
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
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
}
