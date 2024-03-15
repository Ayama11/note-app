import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const.dart';
import 'package:noteapp/views/note_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: F,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Charm'),
      home: const NoteView(),
    );
  }
}
