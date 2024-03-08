import 'package:flutter/material.dart';
import 'note.dart';
import 'notes_list_screen.dart';

class NewNoteModal extends StatefulWidget {
  final Function(Note) onNoteCreated;

  NewNoteModal({required this.onNoteCreated});

  @override
  _NewNoteModalState createState() => _NewNoteModalState();
}

class _NewNoteModalState extends State<NewNoteModal> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Note Title',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final title = _titleController.text.isEmpty ? 'Untitled Note' : _titleController.text;
              final note = Note(
                title: title,
                content: '',
              );
              widget.onNoteCreated(note);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              textStyle: TextStyle(fontSize: 24.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Text('ADD'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}