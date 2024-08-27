import 'package:flutter/material.dart';
import 'custom_text.dart';
class CardDisply extends StatelessWidget {
    final String data;
    final FontWeight fontWeight;
    final double fontSize;
  const CardDisply({super.key,required this.data, required this.fontWeight, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
    Expanded(
    child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child:
          CustomText(
              name: data,
            fontWeight:fontWeight,fontsize:fontSize
          ),

        ),
      ),
    ]);
  }
}
