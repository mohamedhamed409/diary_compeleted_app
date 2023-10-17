import 'package:diary/view/constants.dart';
import 'package:diary/view/custom_bottom_sheet.dart';
import 'package:diary/view/note_view_body.dart';
import 'package:flutter/material.dart';

class NoteViewHome extends StatelessWidget {
  const NoteViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: const NoteViewBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        foregroundColor: Colors.black,
        backgroundColor: Colors.black38,
        child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(border: Border.all(color: kColor)),
            child: const Icon(Icons.add)),
        onPressed: () {
          showModalBottomSheet(
            // isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) => const CustomBottomSheet(),
          );
        },
      ),
    );
  }
}
