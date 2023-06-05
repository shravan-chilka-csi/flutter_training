import 'package:flutter/material.dart';
import 'package:flutter_training/views/list_view_example.dart';
import 'package:flutter_training/views/points_view.dart';
import 'package:flutter_training/views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileView(),
    );
  }
}
