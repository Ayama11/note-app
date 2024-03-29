import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/cubit/add_note/add_note_cubit.dart';
import 'package:noteapp/cubit/add_note/add_note_state.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/views/widgets/custom_buttun.dart';
import 'package:noteapp/views/widgets/custom_textfiled.dart';
import 'package:noteapp/views/widgets/listview_color_item.dart';

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
          const ListViewColor(),
          const SizedBox(height: 30),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoding: state is AddNoteLoding ? true : false,
                onTap: () {
                  validateInput(context);
                },
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  void validateInput(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      var currentDate = DateTime.now();
      var formatCurrentDate =
          DateFormat(DateFormat.YEAR_MONTH_DAY).format(currentDate);
      var noteModel = NoteModel(
          titel: titel!,
          content: content!,
          date: formatCurrentDate,
          color: Colors.grey.value);
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
