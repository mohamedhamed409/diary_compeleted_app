import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void customShowDialog(BuildContext context,
    {required void Function()? onPressedY,
    required void Function()? onPressedN}) {
  showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: const Text('Warning!'),
      content: const Text('Do you want to delete note ?'),
      actions: [
        CupertinoDialogAction(
          onPressed: onPressedY,
          child: const Text('yes'),
        ),
        CupertinoDialogAction(
          onPressed: onPressedN,
          child: const Text('no'),
        )
      ],
    ),
  );
}
