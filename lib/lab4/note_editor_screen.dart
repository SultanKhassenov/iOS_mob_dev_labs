import 'package:flutter/material.dart';
import 'note.dart';
import 'notes_list_screen.dart';

class NoteEditorScreen extends StatefulWidget {
  final Note note;
  final Function(Note) onSave;

  NoteEditorScreen({required this.note, required this.onSave});

  @override
  _NoteEditorScreenState createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note.title),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedNote = Note(
                title: widget.note.title,
                content: _contentController.text,
              );
              widget.onSave(updatedNote);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _contentController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter your note here...',
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }
}