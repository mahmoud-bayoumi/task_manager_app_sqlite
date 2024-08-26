import 'package:flutter/material.dart';
import 'package:untitled1/views/sql_database.dart';
import '../widgets/card_disply.dart';
import 'home_page.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:
          Column(
            children: [
             const SizedBox(height: 20,),
              CardDisply(title:" Title :" ,data: widget.title),
              CardDisply(title:" SubTitle :" ,data: widget.subtitle),
              CardDisply(title:" Describtion : " ,data: widget.describ)
             , const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>const HomePage(),));}
                   ,shape:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                color: Colors.black,
                textColor: const Color(0xffFED42C),
                minWidth: 150,
                height: 70,
                child:const Center(
                  child:  Text(
                    'OK',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
