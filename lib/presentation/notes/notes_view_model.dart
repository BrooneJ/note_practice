import 'package:flutter/foundation.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/use_case/use_cases.dart';
import 'package:note_app/presentation/notes/note_state.dart';
import 'package:note_app/presentation/notes/notes_event.dart';

class NotesViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _state = NotesState(notes: []);
  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  NotesViewModel({required this.useCases}) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes();
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;
      await _loadNotes();
    }
  }
}
