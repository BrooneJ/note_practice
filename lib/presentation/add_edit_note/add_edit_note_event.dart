import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_event.freezed.dart';

@freezed
class AddEditNoteEvent with _$AddEditNoteEvent {
  factory AddEditNoteEvent.changeColor(int color) = ChangeColor;
  factory AddEditNoteEvent.saveNote(int? id, String title, String content) =
      SaveNote;
}
