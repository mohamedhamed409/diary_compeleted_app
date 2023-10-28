import 'package:diary/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:diary/cubit/note_cubit/note_cubit.dart';
import 'package:diary/cubit/note_cubit/note_states.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:diary/shared/shared_preference.dart';
import 'package:diary/view/bloc_observer.dart';
import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'view/note_view_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter((NoteModelAdapter()));
  var box = await Hive.openBox<NoteModel>(kNoteBox);
  Bloc.observer = NoteBlocObserver();

  await CacheHelper.init();
//  box.clear();
  bool isLight = CacheHelper.getBoolean(key: 'isLight')??true;/////last
  runApp(NoteView(isLight));
}

class NoteView extends StatelessWidget {
  const NoteView(
     this. isLight,
      {
    super.key,
  });
  
  final bool isLight;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit()..changeMode(fromSharedPref: isLight),
        ),
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
      ],
      child: (MyWidget()),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteStates>(builder: (context, state) {
      return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Poppins',
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
            backgroundColor: Colors.redAccent,
            hoverColor: Colors.redAccent[100],
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            hoverColor: Colors.blueGrey[400],
          ),
        ),
        themeMode: BlocProvider.of<NoteCubit>(context).isLight
            ? ThemeMode.light
            : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: NoteViewHome(),
      );
    });
  }
}
