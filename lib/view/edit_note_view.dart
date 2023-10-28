import 'package:diary/cubit/note_cubit/note_cubit.dart';
import 'package:diary/cubit/note_cubit/note_states.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:diary/view/color_item_listview.dart';
import 'package:diary/view/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'custom_textformfield.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(noteModel: noteModel),
    );
  }
}

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  @override
  Widget build(BuildContext context) {
    var color = BlocProvider.of<NoteCubit>(context).colorOfContainNote;

    return BlocBuilder<NoteCubit, NoteStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBarForEdit(
                color: color!,
                text: 'Edit',
                customIcon: Icons.check,
                onTap: () {
                  editNoteOnPressed(context);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                initialValue: widget.noteModel.title,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                initialValue: widget.noteModel.content,
                maxLines: 5,
                onChanged: (value) {
                  content = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              // MaterialButton(
              //   onPressed: () {},
              //   child: Text('add image'),
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              CustomColorsListViewForEditing(note: widget.noteModel),
            ],
          ),
        );
      },
    );
  }

  void editNoteOnPressed(BuildContext context) {
    widget.noteModel.title = title ?? widget.noteModel.title;
    widget.noteModel.content = content ?? widget.noteModel.content;
    widget.noteModel.editDate =
        '${DateFormat.yMMMMd().format(DateTime.now())} ${DateFormat('hh:mm a').format(DateTime.now())}';

    widget.noteModel.save(); //when i delete it also work
    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
    Navigator.pop(context);
  }
}
