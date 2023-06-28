import 'package:flutter/material.dart';
import 'package:flutter_training/modules/auth/view/auth_view.dart';
import 'package:flutter_training/modules/auth/view_model/auth_view_model.dart';
import 'package:flutter_training/modules/home/view/home_view.dart';
import 'package:provider/provider.dart';

class AuthGuardView extends StatelessWidget {
  const AuthGuardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        if (authViewModel.isAuthenticated()) {
          return const HomeView();
        } else {
          return const AuthView();
        }
      },
    );
  }
}
