import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNotes {
  final NoteRepository noteRepository;

  GetNotes(this.noteRepository);

  Future<List<Note>> call() async {
    List<Note> notes = await noteRepository.getNotes();
    return notes;
  }
}
