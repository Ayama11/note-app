import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/views/widgets/appbar.dart';

import 'widgets/curculer_icons.dart';
import 'widgets/custom_textfiled.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EditNoteBody();
  }
}

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

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
                      onPreessed: () {})
                ]),
            const SizedBox(height: 50),
            const CustomTextField(hint: 'Titil'),
            const SizedBox(height: 24),
            const CustomTextField(hint: 'Content', maxline: 4)
          ],
        ),
      ),
    );
  }
}
