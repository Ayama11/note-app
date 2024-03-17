abstract class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteSucsse extends AddNoteState {}

final class AddNoteFailure extends AddNoteState {
  String errMesage;

  AddNoteFailure({required this.errMesage});
}
