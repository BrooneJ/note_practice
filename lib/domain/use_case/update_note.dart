import 'package:injectable/injectable.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

@singleton
class UpdateNoteUseCase {
  final NoteRepository _noteRepository;

  UpdateNoteUseCase(this._noteRepository);

  Future<void> execute(Note note) async {
    await _noteRepository.updateNote(note);
  }
}
