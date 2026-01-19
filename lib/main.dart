import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Catatan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NoteListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Widget utama: daftar catatan
class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  // 3 item statis
  final List<String> _notes = [
    "Belajar Flutter State Management",
    "Membuat UI dengan Widget Dasar",
    "Menguji Callback Function di Flutter"
  ];

  int _counter = 0;
  Color _color = Colors.blue;
  double _size = 16.0;
  String _typedText = "";

  // Fungsi callback ketika tombol ditekan
  void _onFabPressed() {
    setState(() {
      _counter++;
      _color = _color == Colors.blue ? Colors.green : Colors.blue;
      _size = _size == 16.0 ? 22.0 : 16.0;
    });
  }

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
            // Input teks dengan callback
            TextField(
              decoration: const InputDecoration(
                labelText: 'Tulis sesuatu...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _typedText = value;
                });
              },
            ),
            const SizedBox(height: 12),
            Text(
              _typedText,
              style: const TextStyle(fontSize: 18),
            ),
            const Divider(height: 24),
            // AnimatedContainer membungkus ListView agar efek animasi terlihat saat state berubah
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                color: _color.withOpacity(0.05),
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: _notes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(Icons.note),
                        title: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          style: TextStyle(
                            fontSize: _size,
                            color: _color,
                          ),
                          child: Text(_notes[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Counter animasi
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 400),
              style: TextStyle(
                fontSize: 18,
                color: _color,
                fontWeight: FontWeight.bold,
              ),
              child: Text('Counter: $_counter'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}