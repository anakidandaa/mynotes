import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _isiController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _isiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Catatan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(
                labelText: 'Judul Catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _isiController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Isi Catatan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_judulController.text.isEmpty ||
                    _isiController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Judul dan isi wajib diisi!"),
                    ),
                  );
                  return;
                }

                Navigator.pop(context, {
                  "judul": _judulController.text,
                  "isi": _isiController.text,
                });
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
