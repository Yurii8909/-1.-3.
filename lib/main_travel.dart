import 'package:flutter/material.dart';
import 'travel_page.dart'; // ← обов'язково імпортуємо твій файл

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelPage(), // ← саме тут вказуємо потрібну сторінку
    );
  }
}
