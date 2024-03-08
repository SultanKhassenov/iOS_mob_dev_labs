import 'package:flutter/material.dart';
import 'notes_app.dart';
import 'notes_list_screen.dart';
import 'new_note_modal.dart';
import 'note_editor_screen.dart';
import 'note.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesApp(),
    ),
  );
}