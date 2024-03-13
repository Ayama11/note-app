import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/views/widgets/appbar.dart';
import 'package:noteapp/views/widgets/listview_notes.dart';

import 'widgets/curculer_icons.dart';
import 'widgets/note_item.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AppBarW(
                  backgroundColor: Colors.transparent,
                  titel: const Text(
                    'Notes',
                    style: TextStyle(fontSize: 22),
                  ),
                  actions: [
                    CircularIcons(
                        backgrounColor: Colors.grey.withOpacity(.4),
                        height: 20,
                        width: 60,
                        size: 26,
                        color: Colors.white,
                        icon: Iconsax.search_normal,
                        onPreessed: () {})
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: ListViewNotes())
          ],
        ),
      ),
    );
  }
}
