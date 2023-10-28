import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.isLoading = false});
  final String text;
  final bool isLoading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: kColor3,
                  )
                : Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
