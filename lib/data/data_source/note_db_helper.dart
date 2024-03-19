import 'package:note_app/domain/models/note.dart';
import 'package:sqflite/sqlite_api.dart';

class NoteDBHelper {
  Database db;

  NoteDBHelper(this.db);

  Future<Note?> getNoteById(int id) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }

    return null;
  }

  Future<List<Note>> getNotes() async {
    final maps = await db.query('notes');
    return maps.map((e) => Note.fromJson(e)).toList();
  }

  Future<void> insertNote(Note note) async {
    await db.insert('notes', note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await db.update(
      'notes',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(Note note) async {
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
