import 'package:flutter/material.dart';
import 'package:untitled1/views/home_page.dart';
import 'package:untitled1/views/sql_database.dart';
import '../widgets/custom_text_field.dart';
class EditNotePage extends StatefulWidget {
  final id;
  final title;
  final subtitle;
  final describ;

   EditNotePage({super.key, this.id, this.title, this.subtitle, this.describ });

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  SqlDataBase sql=SqlDataBase();
  TextEditingController titleeditcontroller=TextEditingController();

   TextEditingController subtitleeditcontroller=TextEditingController();

   TextEditingController describtioneditcontroller=TextEditingController();

  @override
  void initState() {
    titleeditcontroller.text=widget.title;
    subtitleeditcontroller.text=widget.subtitle;
    describtioneditcontroller.text=widget.describ;
    super.initState();
  }

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
          child:
           Column(
            children: [
               CustomTextField(
                hintText: "  ", controller:titleeditcontroller ,
                  ),
               CustomTextField(
                hintText:"  " , controller:subtitleeditcontroller ,
                  ),
               CustomTextField(
                controller: describtioneditcontroller, hintText: "  ",
                maxLines: 12,
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () async {
               int response= await sql.updataData(
                  "${titleeditcontroller.text}" ,
                  "${subtitleeditcontroller.text}",
                 "${describtioneditcontroller.text}",widget.id
               );
               if(response>0){
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => HomePage(),));
               }
               print(response);
                },
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
