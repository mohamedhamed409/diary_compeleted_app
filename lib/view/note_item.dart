import 'package:diary/view/constants.dart';
import 'package:diary/view/edit_note_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: kColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                subtitle: Text('content of item',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                trailing: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '16,Oct,2023',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
