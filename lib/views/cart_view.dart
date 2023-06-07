import 'package:flutter/material.dart';
import 'package:flutter_training/models/catalog_model.dart';
import 'package:flutter_training/widgets/catalog_widget.dart';

class CartView extends StatelessWidget {
  final List<CatalogModel> catalogModels;
  const CartView({
    Key? key,
    required this.catalogModels,
  }) : super(key: key);

  double getTotalPrice() {
    double sum = 0;
    for (CatalogModel catalogModel in catalogModels) {
      sum = sum + catalogModel.price;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: catalogModels.length,
                itemBuilder: (context, index) {
                  final catalogModel = catalogModels[index];
                  return CatalogWidget(
                    catalogModel: catalogModel,
                    onTap: () {},
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 24,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total items added ${catalogModels.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    getTotalPrice().toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
