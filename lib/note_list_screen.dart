import 'package:flutter/material.dart';
import 'detail_note_screen.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final List<String> _notes = [
    "Belajar Flutter State Management",
    "Membuat UI dengan Widget Dasar",
    "Menguji Callback Function di Flutter"
  ];

  int _counter = 0;
  Color _color = Colors.blue;
  double _size = 16.0;
  String _typedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Catatan"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Tulis sesuatu...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => _typedText = value);
              },
            ),
            const SizedBox(height: 12),
            Text(_typedText, style: const TextStyle(fontSize: 18)),
            const Divider(height: 24),

            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(8),
                color: _color.withOpacity(0.05),
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(Icons.note),
                        title: Text(
                          _notes[index],
                          style: TextStyle(fontSize: _size, color: _color),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailNoteScreen(
                                note: _notes[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),

            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              style: TextStyle(fontSize: 18, color: _color),
              child: Text('Counter: $_counter'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-note');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
