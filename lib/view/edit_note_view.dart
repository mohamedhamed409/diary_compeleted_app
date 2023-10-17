import 'package:diary/view/custom_app_bar.dart';
import 'package:diary/view/custom_button.dart';
import 'package:flutter/material.dart';

import 'custom_textformfield.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              text: 'Edit',
              customIcon: Icons.check,
              onTap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'Title',
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'Content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              text: 'Save',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}