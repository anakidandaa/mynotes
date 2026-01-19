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
      title: 'Daftar Catatan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NoteListScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/add-note': (context) => const AddNoteScreen(),
      },
    );
  }
}
