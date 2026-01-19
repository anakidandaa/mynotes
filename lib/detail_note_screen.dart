import 'package:flutter/material.dart';

class DetailNoteScreen extends StatelessWidget {
  final String note;

  const DetailNoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Catatan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          note,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
