import 'package:flutter/material.dart';

class AppTitleWidegt extends StatelessWidget {
  const AppTitleWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Note',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          'Ease',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 237, 145, 253),
          ),
        ),
      ],
    );
  }
}
