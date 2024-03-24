import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const.dart';

import 'package:noteapp/cubit/notes/notes_cubit.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/simple_bloc_observe.dart';
import 'package:noteapp/views/note_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: F,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Charm'),
        home: const NoteView(),
      ),
    );
  }
}
