import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/note_cubit/note_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.maxLines,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.initialValue,
      this.onFieldSubmitted, this.suffixIcon});
  final void Function(String?)? onFieldSubmitted;

  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: BlocProvider.of<NoteCubit>(context).colorOfContainNote,
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        initialValue: initialValue,
        controller: controller,
        onSaved: onSaved,
        onChanged: onChanged,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'field is required!';
          }
        },
        maxLines: maxLines,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kColor),
            borderRadius: BorderRadius.circular(16),
          ),
          // enabledBorder:
        ),
      ),
    );
  }
}
