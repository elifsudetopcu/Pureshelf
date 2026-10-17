import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PureShelfApp());
}

class PureShelfApp extends StatelessWidget {
  const PureShelfApp({super.key});

  @override
  Widget build(BuildContext context) {
    const sage = Color(0xFF8FA58B);

    return MaterialApp(
      title: 'PureShelf',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: sage,
          primary: sage,
          surface: const Color(0xFFFAF8F3),
        ),
        scaffoldBackgroundColor: const Color(0xFFFAF8F3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF8F3),
          foregroundColor: Colors.black87,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: sage,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
