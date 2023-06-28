import 'package:flutter/material.dart';
import 'package:flutter_training/modules/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 24),
          TextField(
            controller: authViewModel.usernameController,
          ),
          TextField(
            controller: authViewModel.passwordController,
          ),
          ElevatedButton(
            onPressed: authViewModel.loginClickEvent,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
