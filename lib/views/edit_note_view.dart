import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/views/widgets/appbar.dart';

import 'widgets/curculer_icons.dart';
import 'widgets/custom_textfiled.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return EditNoteBody(note: note);
  }
}

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? titel, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 20),
            AppBarW(
                backgroundColor: Colors.transparent,
                titel: const Text(
                  'Edit Notes',
                  style: TextStyle(fontSize: 22),
                ),
                actions: [
                  CircularIcons(
                      backgrounColor: Colors.grey.withOpacity(.4),
                      height: 20,
                      width: 60,
                      size: 26,
                      color: Colors.white,
                      icon: Iconsax.edit,
                      onPreessed: () {
                        widget.note.titel = titel ?? widget.note.titel;
                        widget.note.content = content ?? widget.note.content;
                        widget.note.save();

                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Get.back();
                        Get.snackbar('Done', 'edite note done');
                      })
                ]),
            const SizedBox(height: 50),
            CustomTextField(
                onChanged: (value) {
                  titel = value;
                },
                hint: widget.note.titel),
            const SizedBox(height: 24),
            CustomTextField(
                onChanged: (value) {
                  content = value;
                },
                hint: widget.note.content,
                maxline: 4)
          ],
        ),
      ),
    );
  }
}
