import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class UpdateNote {
  final NoteRepository _noteRepository;

  UpdateNote(this._noteRepository);

  Future<void> execute(Note note) async {
    await _noteRepository.updateNote(note);
  }
}
