import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int minLines, maxLines;
  const CustomTextField({
    super.key,
    this.hintText = '',
    this.maxLines = 1,
    this.minLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        maxLines: maxLines,
        minLines: 1,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
