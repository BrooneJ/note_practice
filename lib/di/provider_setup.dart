import 'package:note_app/data/data_source/note_db_helper.dart';
import 'package:note_app/data/repository/note_repository_impl.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/add_note.dart';
import 'package:note_app/domain/use_case/delete_note.dart';
import 'package:note_app/domain/use_case/get_note.dart';
import 'package:note_app/domain/use_case/get_notes.dart';
import 'package:note_app/domain/use_case/update_note.dart';
import 'package:note_app/domain/use_case/use_cases.dart';
import 'package:note_app/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)',
      );
    },
  );

  NoteDBHelper noteDBHelper = NoteDBHelper(database);
  NoteRepository noteRepository = NoteRepositoryImpl(noteDBHelper);
  UseCases useCases = UseCases(
    getNotes: GetNotesUseCase(noteRepository),
    getNote: GetNoteUseCase(noteRepository),
    addNote: AddNoteUseCase(noteRepository),
    updateNote: UpdateNoteUseCase(noteRepository),
    deleteNote: DeleteNoteUseCase(noteRepository),
  );
  NotesViewModel notesViewModel = NotesViewModel(useCases: useCases);

  return [
    ChangeNotifierProvider(create: (context) => notesViewModel),
    Provider(create: (context) => noteRepository),
  ];
}
