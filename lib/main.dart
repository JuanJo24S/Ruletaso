import 'package:flutter/material.dart';
import 'package:ruletaso/screens/start_screen.dart';
import 'package:ruletaso/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeProvider(
      child: StartScreen()
    );
  }

}