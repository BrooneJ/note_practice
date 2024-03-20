import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNoteUseCase {
  final NoteRepository _noteRepository;

  GetNoteUseCase(this._noteRepository);

  Future<Note?> call(int id) async {
    return await _noteRepository.getNoteById(id);
  }
}
