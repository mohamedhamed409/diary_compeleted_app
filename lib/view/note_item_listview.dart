import 'package:flutter/material.dart';

import 'note_item.dart';

class NoteItemListView extends StatelessWidget {
  const NoteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => const NoteItem(),
      separatorBuilder: (context, index) => const Divider(
        //color: Colors.white,
        height: 8,
      ),
      itemCount: 10,
    );
  }
}
