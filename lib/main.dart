import 'package:flutter/material.dart';
import 'package:task_mobile_bool/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Ensure the home page is set properly
    );
  }
}