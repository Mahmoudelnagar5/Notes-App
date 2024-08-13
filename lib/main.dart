import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const NotesApp(),
    ),
  );
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
      ),
      home: const NotesViwe(),
    );
  }
}
