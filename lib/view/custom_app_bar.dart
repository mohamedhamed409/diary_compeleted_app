import 'package:diary/view/constants.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.customIcon,
      required this.onTap,
      required this.text});
  final IconData customIcon;
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kColor2,
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
          const Spacer(),
          CustomAppBarButton(
            icon: customIcon,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
