

import 'package:flutter/material.dart';

class BodyWrapper extends StatelessWidget {
  const BodyWrapper({Key? key, required this.bodyPart}) : super(key: key);

  final Widget bodyPart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(135, 255, 255, 255),
                    Color.fromARGB(159, 255, 255, 255),
                    Color.fromARGB(159, 255, 255, 255),
                    Color.fromARGB(131, 255, 255, 255),
                  ],
                  stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9
                  ])),
          curve: Curves.easeInSine,
          duration: const Duration(seconds: 1),
        ),
        bodyPart
      ],
    );
  }
}
