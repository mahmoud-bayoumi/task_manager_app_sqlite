import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/app_title_widegt.dart';
import '../widgets/note_card.dart';
import 'add_note_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(217, 31, 31, 31),
      appBar: AppBar(
          backgroundColor: Colors.transparent, title: const AppTitleWidegt()),
      body: const NoteCardListView(),
      floatingActionButton: IconButton.filled(
        style: IconButton.styleFrom(
          iconSize: 35,
          backgroundColor: const Color.fromARGB(255, 237, 145, 253),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotePage(),
              ));
        },
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
