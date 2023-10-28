import 'package:bloc/bloc.dart';
import 'package:diary/cubit/note_cubit/note_states.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:diary/shared/shared_preference.dart';
import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(InitialState());
  late Color? colorOfContainNote;
  List<NoteModel>? noteModelList;
  NoteModel? noteModel;
  bool isLight = true;

  fetchAllNotes() {
    Box<NoteModel> noteBox = Hive.box<NoteModel>(kNoteBox);
    noteModelList = noteBox.values.toList();
    emit(NotesSuccess());
  }

  changeMode({bool? fromSharedPref}) {
    if (fromSharedPref != null) {
      isLight = fromSharedPref;
    } else {
      isLight = !isLight;
    }
    colorOfContainNote = isLight ? Colors.grey[400] : kColor2;

    CacheHelper.putBoolean(key: 'isLight', value: isLight);

    emit(ChangeMode());
  }

  List<NoteModel>? noteSearch = [];
  // search({String? titleSearch}) {
  //   int i = 0;

  //   while (i < noteModelList!.length) {

  //     if (noteModelList![i].title == titleSearch) {

  //       noteSearch!.add(noteModelList![i]);
  //       emit(FoundSearchState());
  //     } else {
  //       noteSearch!.clear();
  //       emit(NotFoundSearchState());
  //     }
  //     i++;
  //   }
  // }
  search({String? titleSearch}) {
    noteSearch!.clear();

    for (int i = 0; i < noteModelList!.length; i++) {
      if (titleSearch == noteModelList![i].title) {
        noteSearch!.add(noteModelList![i]);
      }
    }

    emit(FoundSearchState());
  }
}
