import 'package:flutter/material.dart';
import 'package:jokepo/pages/home.dart';
import 'package:jokepo/pages/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jokenpo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      routes: {
        "/": (context) => MyHomePage(),
        "/result": (context) => ResultPage(),
      },
    );
  }
}
