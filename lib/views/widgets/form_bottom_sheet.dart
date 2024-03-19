import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/add_note/add_note_cubit.dart';
import 'package:noteapp/cubit/add_note/add_note_state.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/views/widgets/custom_buttun.dart';
import 'package:noteapp/views/widgets/custom_textfiled.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
  });

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
              hint: 'Titel',
              onSaved: (value) {
                titel = value;
              }),
          const SizedBox(height: 24),
          CustomTextField(
              hint: 'Content',
              maxline: 4,
              onSaved: (value) {
                content = value;
              }),
          const SizedBox(height: 60),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoding: state is AddNoteLoding ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                        titel: titel!,
                        content: content!,
                        date: DateTime.now().toString(),
                        color: Colors.grey.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       if (formKey.currentState!.validate()) {
          //         formKey.currentState!.save();
          //         var noteModel = NoteModel(
          //             titel: titel!,
          //             content: content!,
          //             date: DateTime.now().toString(),
          //             color: Colors.grey.value);
          //         BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
          //       } else {
          //         autovalidateMode = AutovalidateMode.always;
          //         setState(() {});
          //       }
          //     },
          //     child: const Text('add')),
          const SizedBox(height: 44),
        ],
      ),
    );
  }
}
