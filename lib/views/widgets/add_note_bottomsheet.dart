import 'package:flutter/material.dart';
import 'package:noteapp/cubit/add_note/add_note_cubit.dart';
import 'package:noteapp/cubit/add_note/add_note_state.dart';
import 'package:noteapp/views/widgets/custom_buttun.dart';
import 'package:noteapp/views/widgets/custom_textfiled.dart';
import 'package:noteapp/views/widgets/form_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetNote extends StatelessWidget {
  const BottomSheetNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {},
          builder: (context, state) {
            return const FormInput();
          },
        ),
      ),
    );
  }
}
