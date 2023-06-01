import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Color backgroundColor = Colors.red.shade200;

  void buttonClickEvent() {
    setState(() {
      if (backgroundColor == Colors.red.shade200) {
        backgroundColor = Colors.green.shade200;
      } else {
        backgroundColor = Colors.red.shade200;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            buttonClickEvent();
          },
          child: const Text('Change Color'),
        ),
      ),
    );
  }
}
