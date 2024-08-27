import 'package:flutter/material.dart';
import 'package:task_manager_app/views/sql_database.dart';
import 'package:task_manager_app/widgets/app_title_widegt.dart';

import '../widgets/custom_text_field.dart';
import 'home_page.dart';

class EditNotePage extends StatefulWidget {
  final id;
  final title;
  final subtitle;
  final describ;

  EditNotePage({super.key, this.id, this.title, this.subtitle, this.describ});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  SqlDataBase sql = SqlDataBase();
  TextEditingController titleeditcontroller = TextEditingController();

  TextEditingController subtitleeditcontroller = TextEditingController();

  TextEditingController describtioneditcontroller = TextEditingController();

  @override
  void initState() {
    titleeditcontroller.text = widget.title;
    subtitleeditcontroller.text = widget.subtitle;
    describtioneditcontroller.text = widget.describ;
    super.initState();
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: "  ",
                controller: titleeditcontroller,
              ),
              CustomTextField(
                hintText: "  ",
                controller: subtitleeditcontroller,
              ),
              CustomTextField(
                controller: describtioneditcontroller,
                hintText: "  ",
                maxLines: 12,
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () async {
                  int response = await sql.updataData(
                      titleeditcontroller.text,
                      subtitleeditcontroller.text,
                      describtioneditcontroller.text,
                      widget.id);
                  if (response > 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  }
                  // print(response);
                },
                color: const Color.fromARGB(255, 237, 145, 253),
                textColor: Colors.white,
                minWidth: 150,
                child: const Text(
                  'Edit Note',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
