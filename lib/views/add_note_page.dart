import 'package:flutter/material.dart';
import 'package:task_manager_app/views/sql_database.dart';
import 'package:task_manager_app/widgets/app_title_widegt.dart';

import '../widgets/custom_text_field.dart';

import 'home_page.dart';

class AddNotePage extends StatelessWidget {
  SqlDataBase sql = SqlDataBase();
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController subtitlecontroller = TextEditingController();
  final TextEditingController describtioncontroller = TextEditingController();
  AddNotePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(217, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(217, 31, 31, 31),
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
                hintText: 'Note Title',
                controller: titlecontroller,
              ),
              CustomTextField(
                  hintText: 'Subtitle', controller: subtitlecontroller),
              CustomTextField(
                maxLines: 12,
                hintText: 'Description',
                controller: describtioncontroller,
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () async {
                  int response = await sql.insertData(titlecontroller.text,
                      subtitlecontroller.text, describtioncontroller.text);
                  if (response > 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  }
                  //  print(response);
                },
                color: const Color.fromARGB(255, 237, 145, 253),
                textColor: const Color.fromARGB(255, 255, 255, 255),
                minWidth: 150,
                child: const Text(
                  'Add Note',
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
