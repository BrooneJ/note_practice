import 'package:note_app/domain/use_case/add_note.dart';
import 'package:note_app/domain/use_case/delete_note.dart';
import 'package:note_app/domain/use_case/get_note.dart';
import 'package:note_app/domain/use_case/get_notes.dart';
import 'package:note_app/domain/use_case/update_note.dart';

class UseCases {
  final AddNoteUseCase addNote;
  final DeleteNoteUseCase deleteNote;
  final GetNotesUseCase getNotes;
  final GetNoteUseCase getNote;
  final UpdateNoteUseCase updateNote;

  UseCases({
    required this.addNote,
    required this.deleteNote,
    required this.getNotes,
    required this.getNote,
    required this.updateNote,
  });
}
