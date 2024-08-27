import 'package:flutter/material.dart';
import '../views/disply_note_page.dart';
import '../views/edit_note_page.dart';
import '../views/sql_database.dart';
import 'custom_text.dart';
import 'note_fields.dart';

class NoteCardListView extends StatefulWidget {
  const NoteCardListView({super.key});
  @override
  State<NoteCardListView> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCardListView> {
  SqlDataBase sql = SqlDataBase();
  List notes = [];
  Future readDat() async {
    List<Map> response = await sql.readData();
    notes.addAll(response);
    if (mounted) {
      setState(() {});
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
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: notes.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplyNotePage(
                          title: notes[i][NoteFields.title],
                          describ: notes[i][NoteFields.description],
                          subtitle: notes[i][NoteFields.subtitle],
                          id: notes[i][NoteFields.id]),
                    ));
              },
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 237, 145, 253),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              int response =
                                  await sql.deleteData(notes[i][NoteFields.id]);
                              if (response > 0) {
                                notes.removeWhere((element) =>
                                    element[NoteFields.id] ==
                                    notes[i][NoteFields.id]);
                                setState(() {});
                              }
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditNotePage(
                                        title: notes[i][NoteFields.title],
                                        describ: notes[i]
                                            [NoteFields.description],
                                        subtitle: notes[i][NoteFields.subtitle],
                                        id: notes[i][NoteFields.id]),
                                  ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      title: CustomText(
                          fontWeight: FontWeight.bold,
                          name: notes[i][NoteFields.title],
                          fontsize: 24),
                      subtitle: CustomText(
                          fontWeight: FontWeight.w300,
                          name: notes[i][NoteFields.subtitle],
                          fontsize: 18))),
            );
          }),
    );
  }
}
