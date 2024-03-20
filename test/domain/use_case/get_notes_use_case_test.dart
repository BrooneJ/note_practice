import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/get_notes.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/order_type.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test("sort test", () async {
    final repository = MockNoteRepository();
    final getNotes = GetNotesUseCase(repository);

    when(repository.getNotes()).thenAnswer(
      (_) async => [
        Note(title: "title", content: "content", color: 1, timestamp: 0),
        Note(title: "title2", content: "content2", color: 2, timestamp: 1),
      ],
    );

    List<Note> result = await getNotes(NoteOrder.date(OrderType.descending()));

    expect(result, isA<List<Note>>());
    expect(result.first.timestamp, 1);

    result = await getNotes(NoteOrder.date(OrderType.ascending()));
    expect(result.first.timestamp, 0);

    result = await getNotes(NoteOrder.title(OrderType.descending()));
    expect(result.first.title, "title2");

    result = await getNotes(NoteOrder.title(OrderType.ascending()));
    expect(result.first.title, "title");

    result = await getNotes(NoteOrder.color(OrderType.descending()));
    expect(result.first.color, 2);

    result = await getNotes(NoteOrder.color(OrderType.ascending()));
    expect(result.first.color, 1);

    verify(repository.getNotes()).called(6);
  });
}
