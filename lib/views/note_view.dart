import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:noteapp/views/widgets/appbar.dart';

import 'widgets/curculer_icons.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarW(
            backgroundColor: Colors.transparent,
            titel: const Text('Notes'),
            actions: [
              CircularIcons(
                backgrounColor: Colors.grey,
                height: 35,
                width: 48,
                size: 28,
                color: Colors.white,
                icon: Iconsax.search_normal,
                onPreessed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
