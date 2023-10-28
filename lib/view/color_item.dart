import 'package:diary/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isSelected,
    required this.color,
  });
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: isSelected ? 14 : 16,
          backgroundColor: color,
        ),
      ),
    );
  }
}
