import 'package:flutter/material.dart';
import 'package:task_manager_app/views/edit_note_page.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: ListTile(
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditNotePage(),
                    ));
              },
              icon: const Icon(
                Icons.edit,
                size: 30,
              ),
            ),
            title: const Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              'BigTitle',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              'SubTitle',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
