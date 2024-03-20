import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository _noteRepository;

  AddNoteUseCase(this._noteRepository);

  Future<void> call(Note note) async {
    return await _noteRepository.insertNote(note);
  }
}
