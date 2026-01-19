import 'package:flutter/material.dart';

class DetailNoteScreen extends StatelessWidget {
  final Map<String, String> note;

  const DetailNoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note['judul'] ?? 'Detail Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          note['isi'] ?? 'Tidak ada isi catatan',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
