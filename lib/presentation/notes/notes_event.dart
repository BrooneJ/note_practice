import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/models/note.dart';

part 'notes_event.freezed.dart';

@freezed
class NotesEvent<T> with _$NotesEvent<T> {
  factory NotesEvent.loadNotes() = LoadNotes;
  factory NotesEvent.deleteNote(Note note) = DeleteNote;
  factory NotesEvent.restoreNote() = RestoreNote;
}
