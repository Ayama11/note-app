import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';

import 'appbar.dart';
import 'curculer_icons.dart';
import 'listview_notes.dart';

class BodyNoteView extends StatefulWidget {
  const BodyNoteView({
    super.key,
  });

  @override
  State<BodyNoteView> createState() => _BodyNoteViewState();
}

class _BodyNoteViewState extends State<BodyNoteView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
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
          const Expanded(child: ListViewNotes())
        ],
      ),
    );
  }
}
