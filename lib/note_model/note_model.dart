import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String createdDate;
  @HiveField(3)
  int color;
  @HiveField(4)
  String editDate;
  // @HiveField(5)
  // Image? img;

  NoteModel(
      {required this.title,
      required this.content,
      required this.editDate,
      required this.createdDate,
      required this.color});
}
