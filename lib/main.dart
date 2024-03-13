import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:noteapp/views/note_view.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: F,
      theme: ThemeData.dark(),
      home: const NoteView(),
    );
  }
}
//fjffjfjfkdkddkdkslslslslslslslslslslsa;a;a;a;a;