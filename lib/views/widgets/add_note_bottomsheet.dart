import 'package:flutter/material.dart';

import 'package:noteapp/cubit/add_note/add_note_cubit.dart';
import 'package:noteapp/cubit/add_note/add_note_state.dart';
import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/views/widgets/form_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BottomSheetNote extends StatelessWidget {
  const BottomSheetNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      //we can using bloc listener
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSucsse) {
            Get.back();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          }
          if (state is AddNoteFailure) {
            debugPrint('erorr' "${state.errMesage}");
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoding ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 18,
                  right: 18,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: FormInput()),
            ),
          );
        },
      ),
    );
  }
}
