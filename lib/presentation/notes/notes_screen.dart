import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/notes/components/note_item.dart';
import 'package:note_app/presentation/notes/components/order_section.dart';
import 'package:note_app/presentation/notes/notes_event.dart';
import 'package:note_app/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your note",
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              viewModel.onEvent(NotesEvent.toggleOrderSection());
            },
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await context.push('/add_note');

          if (isSaved != null && isSaved) {
            viewModel.onEvent(NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isOrderSectionVisible
                  ? OrderSection(
                      noteOrder: state.noteOrder,
                      onOrderChanged: (noteOrder) {
                        viewModel.onEvent(NotesEvent.changeOrder(noteOrder));
                      },
                    )
                  : Container(),
            ),
            ...state.notes.map(
              (note) => GestureDetector(
                onTap: () async {
                  final uri = Uri(
                    path: '/edit_note',
                    queryParameters: {
                      'note': jsonEncode(note.toJson()),
                    },
                  );
                  bool? isSaved = await context.push(
                    uri.toString(),
                  );

                  if (isSaved != null && isSaved) {
                    viewModel.onEvent(NotesEvent.loadNotes());
                  }
                },
                child: NoteItem(
                  note: note,
                  onDeleteTap: () {
                    viewModel.onEvent(NotesEvent.deleteNote(note));

                    final snackBar = SnackBar(
                      content: const Text("Note deleted"),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          viewModel.onEvent(NotesEvent.restoreNote());
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
