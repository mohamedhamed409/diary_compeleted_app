import 'package:diary/view/constants.dart';
import 'package:diary/view/note_item_listview.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            customIcon: Icons.search,
            text: 'Note',
            onTap: () {},
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
                  color: kColor2,
                ),
                child: const NoteItemListView()),
          ),
        ],
      ),
    );
  }
}
