import 'package:flutter/material.dart';
import 'package:task_manager_app/views/sql_database.dart';
import 'package:task_manager_app/widgets/app_title_widegt.dart';

import '../widgets/card_disply.dart';

class DisplyNotePage extends StatefulWidget {
  final id;
  final title;
  final subtitle;
  final describ;
  const DisplyNotePage(
      {super.key, this.id, this.title, this.subtitle, this.describ});
  @override
  State<DisplyNotePage> createState() => _DisplyNotePageState();
}

class _DisplyNotePageState extends State<DisplyNotePage> {
  SqlDataBase sql = SqlDataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(217, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const AppTitleWidegt(),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 237, 145, 253)),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          elevation: 16,
          color: const Color.fromARGB(255, 237, 145, 253),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardDisply(
                data: widget.title,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              CardDisply(
                data: widget.subtitle,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
              CardDisply(
                data: widget.describ,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
