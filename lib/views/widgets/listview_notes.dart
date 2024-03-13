import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/note_item.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: NoteIteam(),
        );
      },
    );
  }
}
