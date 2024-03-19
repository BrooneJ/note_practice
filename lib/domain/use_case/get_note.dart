import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

class GetNote {
  final NoteRepository _noteRepository;

  GetNote(this._noteRepository);

  Future<Note?> call(int id) async {
    return await _noteRepository.getNoteById(id);
  }
}
