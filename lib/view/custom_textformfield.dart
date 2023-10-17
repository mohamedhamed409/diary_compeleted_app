import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hintText, this.maxLines, this.onSaved});
  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kColor2, ////////
      ),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'field is required !';
          }
        },
        maxLines: maxLines,
        cursorColor: Colors.white,
        decoration: InputDecoration(
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
