import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:noteapp/cubit/add_note/add_note_cubit.dart';
import 'package:noteapp/cubit/add_note/add_note_state.dart';
import 'package:noteapp/views/widgets/custom_buttun.dart';
import 'package:noteapp/views/widgets/custom_textfiled.dart';
import 'package:noteapp/views/widgets/form_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BottomSheetNote extends StatelessWidget {
  const BottomSheetNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSucsse) {
            navigator!.pop(context);
          }
          if (state is AddNoteFailure) {
            debugPrint('erorr' "${state.errMesage}");
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoding ? true : false,
              child: const SingleChildScrollView(child: FormInput()));
        },
      ),
    );
  }
}
