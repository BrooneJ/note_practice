import 'package:flutter/material.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/presentation/notes/components/note_item.dart';
import 'package:note_app/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your note",
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                title: "Note 1",
                content: "Content 1",
                color: wisteria.value,
                timestamp: DateTime.now().microsecondsSinceEpoch,
              ),
            ),
            NoteItem(
              note: Note(
                title: "Note 2",
                content: "Content 2",
                color: skyBlue.value,
                timestamp: DateTime.now().microsecondsSinceEpoch,
              ),
            )
          ],
        ),
      ),
    );
  }
}
