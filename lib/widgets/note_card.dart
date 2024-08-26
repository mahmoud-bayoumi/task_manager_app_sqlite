import 'package:flutter/material.dart';
import 'package:untitled1/views/disply_note_page.dart';
import 'package:untitled1/widgets/custom_text.dart';
import 'package:untitled1/widgets/note_fields.dart';
import '../views/edit_note_page.dart';
import '../views/sql_database.dart';
class NoteCard extends StatefulWidget {
  const NoteCard({super.key});
  @override
  State<NoteCard> createState() => _NoteCardState();
}
class _NoteCardState extends State<NoteCard> {
   SqlDataBase sql=SqlDataBase();
   List notes=[ ];
    Future readDat () async{
         List<Map> response=await sql.readData();
         notes.addAll(response);
         if(mounted){
           setState(() {
           });
         }
       }
   @override
   void initState() {
     readDat();
     super.initState();
   }
   @override
  Widget build(BuildContext context) {
    return ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                height: 20,color: const Color(0xffFED42C),);},
                   physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: notes.length,
              itemBuilder: (context, i) {
              return  InkWell(onTap: (){
                Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) =>DisplyNotePage(title: notes[i][NoteFields.title] ,
                      describ:  notes[i][NoteFields.description] ,
                       subtitle: notes[i][NoteFields.subtitle]
                       ,id: notes[i][NoteFields.id] ),
                 ));},
             child: Container(
               decoration: const BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.all(
               Radius.circular(30),
               ),
               ),child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                      int response= await sql.deleteData(notes[i][NoteFields.id]);
                      if(response>0){
                         notes.removeWhere((element) => element[NoteFields.id]==notes[i][NoteFields.id]);
                          setState(() {
                          });}
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>EditNotePage(title:notes[i][NoteFields.title] ,
                                  describ:notes[i][NoteFields.description] ,subtitle:notes[i][NoteFields.subtitle]
                                  ,id:notes[i][NoteFields.id] ),
                            ));
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                  ],
                ),
               title: CustomText(fontWeight:FontWeight.bold ,
                   name: notes[i][NoteFields.title] ,fontsize: 24
               ),
               subtitle: CustomText(fontWeight:FontWeight.w300 ,
                   name: notes[i][NoteFields.subtitle] ,fontsize: 18
               ),
             )),);
          });}
}
