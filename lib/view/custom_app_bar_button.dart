import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  const CustomAppBarButton(
      {super.key, required this.icon, required this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          //border: Border.all(color: kColor),
          color: Colors.white.withOpacity(.03),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
