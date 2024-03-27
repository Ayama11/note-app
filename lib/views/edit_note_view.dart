import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/const.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/views/widgets/appbar.dart';
import 'package:noteapp/views/widgets/listview_color_item.dart';

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
            CustomTextField(
                onChanged: (value) {
                  content = value;
                },
                hint: widget.note.content,
                maxline: 4),
            const SizedBox(height: 24),
            EditNoteListColor(note: widget.note)
          ],
        ),
      ),
    );
  }
}

class EditNoteListColor extends StatefulWidget {
  const EditNoteListColor({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditNoteListColor> createState() => _EditNoteListColorState();
}

class _EditNoteListColorState extends State<EditNoteListColor> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
