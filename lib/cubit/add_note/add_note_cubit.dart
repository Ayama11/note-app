import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/const.dart';
import 'package:noteapp/cubit/add_note/add_note_state.dart';
import 'package:noteapp/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoding());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);

      await noteBox.add(note);
      emit(AddNoteSucsse());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
