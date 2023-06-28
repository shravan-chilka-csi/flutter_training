import 'package:flutter/material.dart';
import 'package:flutter_training/modules/auth/view/auth_guard_view.dart';
import 'package:flutter_training/modules/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/home/view/home_view.dart';
import '../../modules/user/view_model/user_view_model.dart';
import '../modules/home/view_model/home_view_model.dart';
import 'modules/auth/view/auth_view.dart';

late final SharedPreferences sharedPreferences;

void main() async {
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

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
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const AuthGuardView(),
      ),
    );
  }
}
