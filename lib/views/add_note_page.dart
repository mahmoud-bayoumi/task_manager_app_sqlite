import 'package:flutter/material.dart';
import 'package:untitled1/views/home_page.dart';
import 'package:untitled1/views/sql_database.dart';
import '../widgets/custom_text_field.dart';

class AddNotePage extends StatelessWidget {
  SqlDataBase sql=SqlDataBase();
  final TextEditingController titlecontroller=TextEditingController();
  final TextEditingController subtitlecontroller=TextEditingController();
  final TextEditingController describtioncontroller=TextEditingController();
   AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFED42C),
      appBar: AppBar(
        backgroundColor: const Color(0xffFED42C),
        title: const Text(
          'Add Note',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
               CustomTextField(
                hintText: 'Note Title',controller: titlecontroller,
              ),
               CustomTextField(hintText: 'Subtitle',controller: subtitlecontroller),
               CustomTextField(
                maxLines: 12,
                hintText: 'Description',controller: describtioncontroller,
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () async {
                int response= await  sql.insertData('''
                 INSERT INTO 'notes' ('title','subtitle','describ')
                 VALUES ('${titlecontroller.text }','${subtitlecontroller.text}','${describtioncontroller.text}' ) 
                ''');
                if(response>0){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));

                }
                print(response);

                },
                color: Colors.black,
                textColor: const Color(0xffFED42C),
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
