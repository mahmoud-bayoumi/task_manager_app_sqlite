import 'package:flutter/material.dart';
import 'custom_text.dart';
class CardDisply extends StatelessWidget {
    final String title,data;
  const CardDisply({super.key,required this.title,required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 60,
        decoration: const BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child:  Row(
              children: [
          CustomText(
            name: title  ,
            fontsize: 18,
            fontWeight:FontWeight.bold,maxLines: 5,
          ),
         const  SizedBox(
              width: 20,
            ),
          CustomText(
              name: data,
            fontWeight:FontWeight.w300 ,fontsize:12 ,maxLines: 5,
          ),
          ]
        ),
      ),
    );
  }
}
