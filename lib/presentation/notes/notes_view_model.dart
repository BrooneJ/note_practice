import 'package:flutter/foundation.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/use_case/use_cases.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';
import 'package:note_app/presentation/notes/note_state.dart';
import 'package:note_app/presentation/notes/notes_event.dart';

class NotesViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _state = NotesState(
    notes: [],
    noteOrder: NoteOrder.date(
      OrderType.descending(),
    ),
    isOrderSectionVisible: false,
  );
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
      changeOrder: _changeOrder,
      toggleOrderSection: () {
        _state = state.copyWith(
          isOrderSectionVisible: !state.isOrderSectionVisible,
        );
        notifyListeners();
      },
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes(state.noteOrder);
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

  Future<void> _changeOrder(NoteOrder noteOrder) async {
    _state = state.copyWith(noteOrder: noteOrder);
    await _loadNotes();
  }
}
