import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment Management System',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Arial',
      ),
      home: const LoginPage(),
    );
  }
}
