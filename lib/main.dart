import 'package:flutter/material.dart';
import 'package:flutter_training/modules/home/view/home_view.dart';
import 'package:flutter_training/modules/user/view/user_view.dart';
import 'package:flutter_training/modules/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'modules/home/view_model/home_view_model.dart';

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
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomeView(),
      ),
    );
  }
}
