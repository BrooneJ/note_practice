import 'package:go_router/go_router.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:note_app/presentation/notes/components/note_item.dart';
import 'package:note_app/presentation/notes/notes_screen.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/notes',
  routes: [
    GoRoute(
      path: '/notes',
      builder: (context, state) => const NotesScreen(),
    ),
    GoRoute(
      path: '/add_note',
      builder: (context, state) {
        final repository = context.read<NoteRepository>();
        final viewModel = AddEditNoteViewModel(repository);
        return ChangeNotifierProvider(
          create: (_) => viewModel,
          child: const AddEditNoteScreen(),
        );
      },
    ),
    // GoRoute(
    //   path: '/notes/:id',
    //   builder: (context, state) => const NoteItem(),
    // ),
  ],
);
