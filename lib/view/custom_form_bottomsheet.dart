import 'package:diary/cubit/add_note_cubit/add_note_states.dart';
import 'package:diary/cubit/note_cubit/note_cubit.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:diary/view/color_item_listview.dart';
import 'package:diary/view/custom_button.dart';
import 'package:diary/view/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/add_note_cubit/add_note_cubit.dart';
import 'constants.dart';

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({
    super.key,
  });

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  // TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: GestureDetector(
        child: Container(
          //    height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: BlocProvider.of<NoteCubit>(context).isLight
                ? Colors.white
                : kColor3,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              const SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                hintText: 'Title',
                onSaved: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'Content',
                maxLines: 5,
                onSaved: (value) {
                  content = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              // CustomColorsListView(
              //   colorList: [kColorList],
              // ),
              CustomColorsListViewForAdding(),
      
              SizedBox(
                height: 16,
              ),
              BlocBuilder<AddNoteCubit, AddNoteStates>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddNoteLoadingState,
                    text: 'Add',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        NoteModel note = NoteModel(
                            title: title!,
                            content: content!,
                            createdDate:
                                '${DateFormat.yMMMMd().format(DateTime.now())} ${DateFormat('hh:mm a').format(DateTime.now())}',
                            color: Colors.black.value,
                            editDate: '');
      
                        BlocProvider.of<AddNoteCubit>(context).addNewNote(note);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
