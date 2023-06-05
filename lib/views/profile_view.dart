import 'package:flutter/material.dart';
import 'package:flutter_training/views/points_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PointsView(),
              ),
            );
          },
          child: const Text('Go to points'),
        ),
      ),
    );
  }
}
