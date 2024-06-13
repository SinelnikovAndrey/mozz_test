import 'package:flutter/material.dart';
import 'package:mozz_chat/screens/home.dart';
import 'package:mozz_chat/screens/login.dart';
import 'package:mozz_chat/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mozz',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3CED78)),
        useMaterial3: true,
      ),
      routes: {
        "/home": (context) => const HomePage(),
        "/signup": (context) => const SignUpPage(),
        "/login": (context) => const LoginPage(),
      },    );
  }
}


