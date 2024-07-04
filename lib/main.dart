import 'package:bmi_calculator/home.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    primary: Colors.blue.shade900,
    error: Colors.red.shade400,
    secondary: Colors.blue.shade300);

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.blue,
    primary: Colors.blue.shade700,
    error: Colors.red.shade400,
    secondary: Colors.blue.shade400);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        useMaterial3: true,
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: kDarkColorScheme.secondary,
        //   ),
        // ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(16.5),
            ),
          ),
      ),
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,

          ),
        ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(16.5),
            ),
          ),),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
