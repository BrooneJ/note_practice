import 'package:flutter/material.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_event.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = Colors.white.value;
  int get color => _color;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  void _changeColor(int color) {
    _color = color;
    notifyListeners();
  }

  void _saveNote(int? id, String title, String content) async {
    if (id == null) {
      await repository.insertNote(
        Note(
          title: title,
          content: content,
          color: color,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
          id: id,
          title: title,
          content: content,
          color: color,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    }
  }
}
