import 'package:diary/note_model/note_model.dart';
import 'package:diary/view/constants.dart';
import 'package:diary/view/note_view_home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  var box = await Hive.openBox<NoteModel>(kNoteBox);

  runApp(const NoteView());
}

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const NoteViewHome(),
    );
  }
}
