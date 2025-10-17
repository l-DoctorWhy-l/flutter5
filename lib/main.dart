import 'package:flutter/material.dart';
import 'features/players/team_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TeamContainer(),
    );
  }
}
