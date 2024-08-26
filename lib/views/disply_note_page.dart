import 'package:flutter/material.dart';
import 'package:untitled1/views/sql_database.dart';
import '../widgets/card_disply.dart';

class DisplyNotePage extends StatefulWidget {
  final id;
  final title;
  final subtitle;
  final describ;
  const DisplyNotePage({super.key,this.id, this.title, this.subtitle, this.describ});
  @override
  State<DisplyNotePage> createState() => _DisplyNotePageState();
}
class _DisplyNotePageState extends State<DisplyNotePage> {
  SqlDataBase sql =SqlDataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFED42C),
      appBar: AppBar(
        backgroundColor: const Color(0xffFED42C),
        title: const Text(
          'Disply Note',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          elevation: 16,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardDisply(data: widget.title,  fontSize: 32,
                fontWeight: FontWeight.bold,),
              CardDisply(data: widget.subtitle,fontSize: 25,
                fontWeight: FontWeight.w700,),
              CardDisply(data: widget.describ,  fontSize: 20,
                fontWeight: FontWeight.w500,)
             , const SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
