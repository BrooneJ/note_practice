import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/data/data_source/note_db_helper.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db text', () async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    await db.execute(
        'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDBHelper(db);

    await noteDbHelper.insertNote(Note(
      title: "text",
      content: "test",
      color: 1,
      timestamp: 1,
    ));

    expect((await noteDbHelper.getNotes()).length, 1);

    Note note = (await noteDbHelper.getNoteById(1))!;
    expect(note.id, 1);

    await noteDbHelper.updateNote(note.copyWith(title: "new title"));
    note = (await noteDbHelper.getNoteById(1))!;
    expect(note.title, "new title");

    await noteDbHelper.deleteNote(note);
    expect((await noteDbHelper.getNotes()).length, 0);

    await db.close();
  });
}
