import 'package:flutter/material.dart';
import 'package:flutter_training/view_model/catalog_view_model.dart';
import 'package:flutter_training/views/cart_view.dart';
import 'package:flutter_training/views/login_view.dart';
import 'package:flutter_training/widgets/catalog_widget.dart';
import 'package:provider/provider.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final catalogViewModel = context.watch<CatalogViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CartView(),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Welcome back, Admin',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: const Text('Logout'),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: catalogViewModel.allCatalogModels.length,
                itemBuilder: (context, index) {
                  final catalogModel = catalogViewModel.allCatalogModels[index];
                  return CatalogWidget(
                    label: 'Add',
                    catalogModel: catalogModel,
                    onTap: () {
                      catalogViewModel.addCatalogModel(catalogModel);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Item added to cart - ${catalogModel.name}',
                          ),
                          backgroundColor: Colors.green.shade300,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
