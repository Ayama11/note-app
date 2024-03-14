import 'package:flutter/material.dart';
import 'package:noteapp/const.dart';
import 'package:noteapp/views/widgets/custom_buttun.dart';
import 'package:noteapp/views/widgets/custom_textfiled.dart';

class BottomSheetNote extends StatelessWidget {
  const BottomSheetNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomTextField(
              hint: 'Titel',
            ),
            SizedBox(height: 24),
            CustomTextField(hint: 'content', maxline: 4),
            SizedBox(height: 60),
            CustomButton(),
            SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
