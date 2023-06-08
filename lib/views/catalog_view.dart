import 'package:flutter/material.dart';
import 'package:flutter_training/models/catalog_model.dart';
import 'package:flutter_training/utils/utils.dart';
import 'package:flutter_training/views/cart_view.dart';
import 'package:flutter_training/views/login_view.dart';
import 'package:flutter_training/widgets/catalog_widget.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({
    super.key,
  });

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  List<CatalogModel> addedCatalogModels = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartView(
                    catalogModels: addedCatalogModels,
                  ),
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
                itemCount: catalogModels.length,
                itemBuilder: (context, index) {
                  final catalogModel = catalogModels[index];
                  return CatalogWidget(
                    label: 'Add',
                    catalogModel: catalogModel,
                    onTap: () {
                      addedCatalogModels.add(catalogModel);
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
