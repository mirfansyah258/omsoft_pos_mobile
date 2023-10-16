import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/pages/home.dart';
import 'package:omsoft_pos_mobile/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        '/login': (context) => const Login(title: 'Login',),
        '/home': (context) => const Home(),
      },
    );
  }
}