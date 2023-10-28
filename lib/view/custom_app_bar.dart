// import 'package:flutter/material.dart';

// import 'custom_app_bar_button.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     required this.customIcon,
//     required this.onTap,
//     required this.text,
//     required this.color,
//     this.onPressed,
//     required this.iconButtonIsExist,
//   });
//   final IconData customIcon;
//   final void Function()? onTap;
//   final String text;
//   final Color color;
//   final void Function()? onPressed;
//   final bool iconButtonIsExist;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: color,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//               fontSize: 26,
//             ),
//           ),
//           iconExist(iconButtonIsExist: true, onPressed: onPressed)!,

//           CustomAppBarButton(
//             icon: customIcon,
//             onTap: onTap,
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

import 'custom_app_bar_button.dart';

class CustomAppBarForEdit extends StatelessWidget {
  const CustomAppBarForEdit({
    super.key,
    required this.customIcon,
    required this.onTap,
    required this.text,
    required this.color,
  });
  final IconData customIcon;
  final void Function()? onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
          CustomAppBarButton(
            icon: customIcon,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}



class CustomAppBarForHomeView extends StatelessWidget {
  const CustomAppBarForHomeView({
    super.key,
    required this.customIcon,
    required this.onTap,
    required this.text,
    required this.color,required this.onPressed,
  });
  final IconData customIcon;
  final void Function()? onTap;
  final String text;
  final Color color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
          IconButton(onPressed:onPressed, icon: Icon(Icons.dark_mode)),
          CustomAppBarButton(
            icon: customIcon,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

/*
Widget? iconExist({required bool iconButtonIsExist, void Function()? onPressed}) {
  if (iconButtonIsExist)
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.dark_mode),
    );
  else
    return null;
}
 */