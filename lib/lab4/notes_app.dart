import 'package:flutter/material.dart';
import 'note.dart';
import 'notes_list_screen.dart';

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 233, 199, 255),
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 233, 199, 255),
        ),
      ),
      home: NotesListScreen(),
    );
  }
}