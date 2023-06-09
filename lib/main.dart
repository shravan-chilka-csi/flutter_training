import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_training/view/counter_view.dart';
import 'package:flutter_training/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterView(),
      ),
    );
  }
}
