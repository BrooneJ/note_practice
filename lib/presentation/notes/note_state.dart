import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/models/note.dart';

part 'note_state.freezed.dart';
part 'note_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required List<Note> notes,
  }) = _NotesState;

  factory NotesState.fromJson(Map<String, dynamic> json) =>
      _$NotesStateFromJson(json);
}
