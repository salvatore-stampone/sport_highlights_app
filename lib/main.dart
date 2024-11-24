import 'package:flutter/material.dart';
import 'screens/matches_screen.dart';

void main() {
  runApp(const SportHighlightsApp());
}

class SportHighlightsApp extends StatelessWidget {
  const SportHighlightsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport Highlights',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MatchesScreen(),
    );
  }
}
