import 'package:bloc/bloc.dart';
import 'package:diary/cubit/add_note_cubit/add_note_states.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:diary/view/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(AddNoteInitialState());
   int colorIndex = 0;
  //Color color = kColorList[0];
  addNewNote(NoteModel note) async {
    note.color = kColorList[colorIndex].value;
    //note.color = color.value;
    try {
      emit(AddNoteLoadingState());
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kNoteBox);
      await noteBox.add(note);

      emit(AddNoteSuccessState());
    } catch (ex) {
      emit(AddNoteFailureState('Error is >>>${ex.toString()}'));
    }
  }
}
