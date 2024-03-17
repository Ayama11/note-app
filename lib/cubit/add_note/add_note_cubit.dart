import 'package:bloc/bloc.dart';
import 'package:noteapp/cubit/add_note/add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
}
