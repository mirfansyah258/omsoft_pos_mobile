import 'package:flutter/material.dart';
import 'package:omsoft_pos_mobile/config.dart';
import 'package:omsoft_pos_mobile/pages/auth.dart';
import 'package:omsoft_pos_mobile/pages/home.dart';
import 'package:omsoft_pos_mobile/pages/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        scaffoldBackgroundColor: bgBlue,
        useMaterial3: true,
      ),
      home: const AuthUser(),
      routes: {
        '/login': (context) => const Login(title: 'Login',),
        '/home': (context) => const Home(),
      },
    );
  }
}