import 'package:diary/cubit/note_cubit/note_states.dart';
import 'package:diary/view/note_item_listview.dart';
import 'package:diary/view/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/note_cubit/note_cubit.dart';
import 'custom_app_bar.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});
  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
    super.initState();
  }

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<NoteCubit, NoteStates>(
      builder: (context, state) {  
          var color = BlocProvider.of<NoteCubit>(context).colorOfContainNote;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomAppBarForHomeView(
                onPressed: () {
                  BlocProvider.of<NoteCubit>(context).changeMode();
                },
                color: color!,
                customIcon: Icons.search,
                text: 'Note Your Diary Today',
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchView()));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: color,
                    ),
                    child: const NoteItemListView()),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
