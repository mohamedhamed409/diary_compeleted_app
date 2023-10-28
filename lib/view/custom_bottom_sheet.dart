import 'package:diary/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:diary/cubit/add_note_cubit/add_note_states.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:diary/view/custom_form_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/note_cubit/note_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
        
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteStates>(
        listener: (BuildContext context, AddNoteStates state) {
          if (state is AddNoteFailureState) {
            print(state.error);
          }
          if (state is AddNoteSuccessState) {
            BlocProvider.of<NoteCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteLoadingState,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                    child: BottomSheetForm(
                )),
              ));
        },
      ),
    );
  }
}
