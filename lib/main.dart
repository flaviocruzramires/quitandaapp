import 'package:flutter/material.dart';
import 'package:quitandaapp/src/pages/auth/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quitanda App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[800]!),
        useMaterial3: true,
      ),
      home: const SigInScreean(),
    );
  }
}
