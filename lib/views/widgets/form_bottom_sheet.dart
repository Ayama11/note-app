import 'package:flutter/material.dart';
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
                value = titel;
              }),
          const SizedBox(height: 24),
          CustomTextField(
              hint: 'Content',
              maxline: 4,
              onSaved: (value) {
                value = content;
              }),
          const SizedBox(height: 60),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 44),
        ],
      ),
    );
  }
}
