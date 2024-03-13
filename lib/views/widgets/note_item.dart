import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NoteIteam extends StatelessWidget {
  const NoteIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(left: 8, top: 16, bottom: 16),
              child: Text('Flutter Notes'),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 8, left: 8, bottom: 16),
              child: Text('Build you carer with tharwat'),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.trash,
                  size: 26,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16),
            child: Text(
              'Mars, 13/2024',
              style: TextStyle(color: Colors.black.withOpacity(0.3)),
            ),
          )
        ],
      ),
    );
  }
}
