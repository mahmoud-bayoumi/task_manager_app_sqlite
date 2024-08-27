import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int minLines, maxLines;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        style: const TextStyle(color: Colors.white, fontSize: 20),
        controller: controller,
        maxLines: maxLines,
        minLines: 1,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 139, 138, 138))),
      ),
    );
  }
}
