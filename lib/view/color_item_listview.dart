import 'package:diary/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:diary/note_model/note_model.dart';
import 'package:diary/view/color_item.dart';
import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/note_cubit/note_cubit.dart';

class CustomColorsListViewForAdding extends StatefulWidget {
  const CustomColorsListViewForAdding({
    super.key,
  });
  @override
  State<CustomColorsListViewForAdding> createState() =>
      _CustomColorsListViewForAddingState();
}

class _CustomColorsListViewForAddingState
    extends State<CustomColorsListViewForAdding> {
  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
          color: BlocProvider.of<NoteCubit>(context).colorOfContainNote,
          borderRadius: BorderRadius.circular(16)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentSelected = index;
              BlocProvider.of<AddNoteCubit>(context).colorIndex = index;
              // we use it directy
              // BlocProvider.of<AddNoteCubit>(context).color=kColorList[index];//or use this with comment line in cubit
              // currentSelected = kColorList.indexOf(kColorList[index]);//repeated and not usful
              // color = kColorList[index];not usful
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ColorItem(
                isSelected: currentSelected == index,
                color: kColorList[index],
              ),
            ),
          );
        },
        itemCount: kColorList.length,
      ),
    );
  }
}

/* 
ملاحظة
we can't access color or index from CustomColorsListView directly and pathing it to NoteModel in onTap funcation in BottomSheetForm 
because of CustomColorsListView exist below of it in the tree
so we use cubit in this process to transmit the value of color or index and give the value to color or indext to NoteModel on cubit directly
so the value of color onTap in BottomSheetForm is usless 
 */

class CustomColorsListViewForEditing extends StatefulWidget {
  const CustomColorsListViewForEditing({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  _CustomColorsListViewForEditingState createState() =>
      _CustomColorsListViewForEditingState();
}

class _CustomColorsListViewForEditingState
    extends State<CustomColorsListViewForEditing> {
  late int currentSelected;
  @override
  void initState() {
    currentSelected = kColorList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      width: 200,
      height: 50,
      decoration: BoxDecoration(
          color: BlocProvider.of<NoteCubit>(context).colorOfContainNote,
          borderRadius: BorderRadius.circular(16)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentSelected = index;
              widget.note.color = kColorList[index]
                  .value; //this is another solution to trasmit data

              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ColorItem(
                isSelected: currentSelected == index,
                color: kColorList[index],
              ),
            ),
          );
        },
        itemCount: kColorList.length,
      ),
    );
  }
}
