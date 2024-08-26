import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int minLines, maxLines;
  const CustomTextField({
    super.key,
    required this.hintText ,
    this.maxLines = 1,
    this.minLines = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        minLines: 1,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
