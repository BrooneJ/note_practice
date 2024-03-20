import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository noteRepository;

  GetNotesUseCase(this.noteRepository);

  Future<List<Note>> call() async {
    List<Note> notes = await noteRepository.getNotes();
    notes.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return notes;
  }
}
