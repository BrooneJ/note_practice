import 'package:note_app/data/data_source/note_db.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDB db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNoteById(note);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
    await db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
