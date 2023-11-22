import 'package:diary/cubit/note_cubit/note_states.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/note_cubit/note_cubit.dart';
import 'note_item.dart';

class NoteItemListView extends StatelessWidget {
  const NoteItemListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteStates>(
      builder: (context, state) {
        List<NoteModel> noteModel =
            BlocProvider.of<NoteCubit>(context).noteModelList!;

        return ListView.separated(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return NoteItem(
              noteModel: noteModel[index],
            );
          },
          separatorBuilder: (context, index) => const Divider(
            //color: Colors.white,
            height: 10,
          ),
          itemCount:
              noteModel.length, ////  Hive.box<NoteModel>(kNoteBox).length,

          // itemCount: 1,
        );
      },
    );
  }
}
