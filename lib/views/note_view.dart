import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/views/widgets/appbar.dart';
import 'package:noteapp/views/widgets/listview_notes.dart';

import 'widgets/body_note_view.dart';
import 'widgets/curculer_icons.dart';
import 'widgets/note_item.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyNoteView(),
    );
  }
}
