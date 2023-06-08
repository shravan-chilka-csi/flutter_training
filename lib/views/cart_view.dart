import 'package:flutter/material.dart';
import 'package:flutter_training/view_model/catalog_view_model.dart';
import 'package:flutter_training/widgets/catalog_widget.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalogViewModel = context.watch<CatalogViewModel>();
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
                itemCount: catalogViewModel.addedCatalogModels.length,
                itemBuilder: (context, index) {
                  final catalogModel =
                      catalogViewModel.addedCatalogModels[index];
                  return CatalogWidget(
                    label: 'Remove',
                    catalogModel: catalogModel,
                    onTap: () {
                      catalogViewModel.removeCatalogModel(catalogModel);
                    },
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
                    'Total items added ${catalogViewModel.addedCatalogModels.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    catalogViewModel.getTotalPrice().toString(),
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
