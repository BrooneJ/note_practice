import 'package:injectable/injectable.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';

@singleton
class DeleteNoteUseCase {
  final NoteRepository _noteRepository;

  DeleteNoteUseCase(this._noteRepository);

  Future<void> call(Note note) async {
    return await _noteRepository.deleteNote(note);
  }
}
