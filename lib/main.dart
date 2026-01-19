import 'package:flutter/material.dart';
import 'note_list_screen.dart';
import 'add_note_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Catatan",
      debugShowCheckedModeBanner: false,
      home: const NoteListScreen(),
      routes: {
        '/add-note': (context) => const AddNoteScreen(),
      },
    );
  }
}
