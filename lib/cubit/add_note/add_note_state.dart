abstract class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoding extends AddNoteState {}

final class AddNoteSucsse extends AddNoteState {}

final class AddNoteFailure extends AddNoteState {
  final String errMesage;

  AddNoteFailure(this.errMesage);
}
