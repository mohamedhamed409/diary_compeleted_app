import 'package:diary/note_model/note_model.dart';
import 'package:diary/view/edit_note_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/note_cubit/note_cubit.dart';
import 'custom_show_dialog.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(noteModel: noteModel);
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  noteModel.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                ),
                subtitle: Text(noteModel.content,
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                trailing: IconButton(
                  hoverColor: Colors.blueAccent,
                  onPressed: () {
                    customShowDialog(context, onPressedY: () {
                      noteModel.delete();
                      BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                      Navigator.pop(context);
                    }, onPressedN: () {
                      Navigator.pop(context);
                    });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ' ${noteModel.editDate}' == ' '
                            ? ' '
                            : 'Edited At : ${noteModel.editDate}',
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Created At : ${noteModel.createdDate}',
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 10),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
