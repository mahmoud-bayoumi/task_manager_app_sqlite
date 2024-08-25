import 'package:flutter/material.dart';
import '../views/edit_note_page.dart';
import '../views/sql_database.dart';
class NoteCard extends StatefulWidget {

   NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
   SqlDataBase sql=SqlDataBase();
   List notes=[ ];
    Future readDat () async{
         List<Map> response=await sql.readData('''
           SELECT * FROM 'notes'
         ''');
         notes.addAll(response);
         if(this.mounted){
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
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child:Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: notes.length,
           itemBuilder: (context, i) {
           return  ListTile(
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                    int response= await sql.deleteData('''
                    DELETE FROM 'notes' WHERE id=${notes[i]['id']}
                    ''');
                    print(response);
                    if(response>0){
                       notes.removeWhere((element) => element['id']==notes[i]['id']);
                        setState(() {

                        });
                    }

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
                            builder: (context) =>EditNotePage(title:notes[i]['title'] ,
                                describ:notes[i]['describ'] ,subtitle:notes[i]['subtitle']
                                ,id:notes[i]['id'] ),
                          ));
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 30,
                    ),
                  ),
                ],
              ),
              title:  Text(
                notes[i]['title']
,                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                //'BigTitle',

                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle:  Text(
                notes[i]['subtitle']
                ,maxLines: 1,
                overflow: TextOverflow.ellipsis,

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          }
          ),
        ),

    );
  }
}
