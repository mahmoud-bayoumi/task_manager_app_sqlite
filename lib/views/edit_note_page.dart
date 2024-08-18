import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/custom_text_field.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFED42C),
      appBar: AppBar(
        backgroundColor: const Color(0xffFED42C),
        title: const Text(
          'Edit Note',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const CustomTextField(
                  // real title from database
                  ),
              const CustomTextField(
                  // subtitle from database
                  ),
              const CustomTextField(
                maxLines: 12,
                // description from database
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.black,
                textColor: const Color(0xffFED42C),
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
