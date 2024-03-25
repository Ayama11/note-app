import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/views/edit_note_view.dart';

class NoteIteam extends StatelessWidget {
  const NoteIteam({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => EditNoteView(
              note: note,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(note.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
                child: Text(note.titel,
                    style: const TextStyle(fontSize: 22, color: Colors.black)),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 16),
                child: Text(note.content, style: const TextStyle(fontSize: 18)),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Get.snackbar('Done', 'delet note');
                  },
                  icon:
                      const Icon(Iconsax.trash, size: 26, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16),
              child: Text(note.date,
                  style: TextStyle(color: Colors.black.withOpacity(0.3))),
            )
          ],
        ),
      ),
    );
  }
}
