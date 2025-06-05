// theme_provider.dart

import 'package:flutter/material.dart';

final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(
  ThemeData(


    //ElevatedButton styles
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red[700],
        textStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold
        ),
      ),
    ),

    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark
    ),
    useMaterial3: true,
  ),
);

class ThemeProvider extends StatelessWidget {
  final Widget child;

  const ThemeProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder<ThemeData>(
      valueListenable: themeNotifier,
      builder: (context, theme, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: child,
        );
      }
    );
  }

}