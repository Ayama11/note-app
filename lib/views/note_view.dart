import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/views/widgets/add_note_bottomsheet.dart';

import 'widgets/body_note_view.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                context: context,
                builder: (context) {
                  return const BottomSheetNote();
                });
          },
          child: const Icon(
            Iconsax.note_add,
            size: 28,
          ),
        ),
        body: const BodyNoteView(),
      ),
    );
  }
}
