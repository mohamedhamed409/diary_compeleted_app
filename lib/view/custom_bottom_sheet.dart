import 'package:diary/view/constants.dart';
import 'package:diary/view/custom_button.dart';
import 'package:diary/view/custom_textformfield.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      // padding:
      //     EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      physics: BouncingScrollPhysics(),
      child: BottomSheetForm(),
    );
  }
}

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({
    super.key,
  });

  @override
  State<BottomSheetForm> createState() => _BottomSheetFormState();
}

class _BottomSheetFormState extends State<BottomSheetForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
   String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: kColor3,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(
              height: 32,
            ),
            const CustomTextFormField(hintText: 'Title'),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFormField(
              hintText: 'Content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              text: 'Add',
              onTap: () {},
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
        ),
      ),
    );
  }
}
