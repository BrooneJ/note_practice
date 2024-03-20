import 'package:flutter/material.dart';
import 'package:note_app/ui/colors.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  Color selectedColor = skyBlue;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        color: selectedColor,
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: noteColors
                    .map(
                      (color) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        child: _buildBackgroundColor(
                          color: color,
                          isSelected: color == selectedColor,
                        ),
                      ),
                    )
                    .toList(),
              ),
              TextField(
                controller: _titleController,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: darkGray),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: darkGray),
                decoration: const InputDecoration(
                  hintText: "Content",
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({
    required Color color,
    required bool isSelected,
  }) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: isSelected
            ? Border.all(
                color: Colors.black,
                width: 2,
              )
            : null,
      ),
    );
  }
}
