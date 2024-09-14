import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 66, 192, 234),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: const Color.fromARGB(255, 200, 248, 255),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 128, 128),
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardTheme().copyWith(
          shadowColor: const Color.fromARGB(255, 0, 128, 128),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: Color.fromARGB(255, 0, 128, 128),
              width: 1,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 128, 128),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
