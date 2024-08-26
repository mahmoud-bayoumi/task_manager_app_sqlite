import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String name;
  final FontWeight fontWeight;
  final double fontsize;
  final int minLines, maxLines;
  const CustomText({super.key,
     this.maxLines = 1,
     this.minLines = 1,
     required this.fontWeight,
     required this.fontsize,
     required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
      fontSize: fontsize,
      fontWeight: fontWeight,
    ),);
  }
}
