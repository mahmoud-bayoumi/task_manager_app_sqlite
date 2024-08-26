import 'package:flutter/material.dart';
import '../widgets/note_card.dart';
import 'add_note_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFED42C),
      appBar: AppBar(
        backgroundColor: const Color(0xffFED42C),
        title: const Text(
          'Notes',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          child: ListView(
            children: [
              Padding(
                  padding: const EdgeInsets.only( top: 15,),
                  child: NoteCard()
          )]
          ),
        ),
      ),
      floatingActionButton: IconButton.filled(
        style: IconButton.styleFrom(
          iconSize: 35,
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  AddNotePage(),
              ));
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
