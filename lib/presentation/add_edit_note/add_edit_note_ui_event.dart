import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_ui_event.freezed.dart';

@freezed
class AddEditNoteUiEvent with _$AddEditNoteUiEvent {
  factory AddEditNoteUiEvent.saveNote() = SaveNote;
}
