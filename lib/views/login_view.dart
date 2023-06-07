import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_training/views/catalog_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    log('initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Username',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              controller: userNameController,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: '*',
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                loginClickEvent();
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }

  void loginClickEvent() {
    final userName = userNameController.text;
    final password = passwordController.text;
    if (userName == 'admin' && password == '12345678') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Welcome back!'),
          backgroundColor: Colors.green.shade300,
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const CatalogView(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Invalid credentials!'),
          backgroundColor: Colors.red.shade300,
        ),
      );
    }
  }

  @override
  void dispose() {
    log('dispose');
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
