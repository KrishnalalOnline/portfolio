import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: Colors.blueAccent,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 36),
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
    ),
  );
}