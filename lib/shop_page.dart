import 'package:flutter/material.dart';
import 'package:flutter_training/product_widget.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProductWidget(),
            ProductWidget(),
            ProductWidget(),
            ProductWidget(),
            ProductWidget(),
            ProductWidget(),
            ProductWidget(),
            ProductWidget(),
          ],
        ),
      ),
    );
  }
}
