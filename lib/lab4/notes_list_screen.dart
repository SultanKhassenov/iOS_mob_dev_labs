import 'package:flutter/material.dart';
import 'note.dart';
import 'note_editor_screen.dart';
import 'new_note_modal.dart';


class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> with SingleTickerProviderStateMixin {
  final List<Note> _notes = [];
  late AnimationController _animationController;
  bool _isSelectionMode = false;
  List<Note> _selectedNotes = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSelectionMode ? 'Selected Notes' : 'Notes'),
        actions: _isSelectionMode
            ? [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _notes.removeWhere((note) => _selectedNotes.contains(note));
                      _selectedNotes.clear();
                      _isSelectionMode = false;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      _selectedNotes.clear();
                      _isSelectionMode = false;
                    });
                  },
                ),
              ]
            : [],
      ),
      body: _notes.isEmpty
          ? Center(
              child: Text(
                "It's empty here...",
                style: TextStyle(fontSize: 24.0),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40.0),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color.fromARGB(41, 0, 0, 0).withOpacity(0.1),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () {
                              setState(() {
                                _isSelectionMode = true;
                                _selectedNotes.add(_notes[index]);
                              });
                            },
                            onTap: () {
                              if (_isSelectionMode) {
                                setState(() {
                                  if (_selectedNotes.contains(_notes[index])) {
                                    _selectedNotes.remove(_notes[index]);
                                    if (_selectedNotes.isEmpty) {
                                      _isSelectionMode = false;
                                    }
                                  } else {
                                    _selectedNotes.add(_notes[index]);
                                  }
                                });
                              }
                            },
                            child: Container(
                              color: _selectedNotes.contains(_notes[index])
                                  ? Colors.blue.withOpacity(0.3)
                                  : Colors.transparent,
                              child: Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                background: Container(
                                  color: Color.fromARGB(255, 255, 17, 0).withOpacity(0.7),
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: AnimatedBuilder(
                                      animation: _animationController,
                                      builder: (context, child) {
                                        return Container(
                                          color: Color.lerp(
                                              Colors.transparent, Colors.black, _animationController.value),
                                          child: child,
                                        );
                                      },
                                      child: Icon(Icons.delete, color: const Color.fromARGB(255, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  setState(() {
                                    _notes.removeAt(index);
                                  });
                                },
                                onResize: () {
                                  _animationController.value = 0;
                                },
                                movementDuration: Duration.zero,
                                child: ListTile(
                                  contentPadding: EdgeInsets.only(left: 25.0, right: 20.0),
                                  title: Text(
                                    _notes[index].title,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onTap: () {
                                    if (!_isSelectionMode) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NoteEditorScreen(
                                            note: _notes[index],
                                            onSave: (note) {
                                              setState(() {
                                                _notes[index] = note;
                                              });
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: NewNoteModal(
                onNoteCreated: (note) {
                  setState(() {
                    _notes.add(note);
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 233, 199, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}