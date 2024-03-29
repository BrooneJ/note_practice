import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/util/note_order.dart';

part 'note_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required List<Note> notes,
    required NoteOrder noteOrder,
    required bool isOrderSectionVisible,
  }) = _NotesState;
}
