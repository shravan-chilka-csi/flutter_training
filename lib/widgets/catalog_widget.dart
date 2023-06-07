import 'package:flutter/material.dart';
import 'package:flutter_training/models/catalog_model.dart';

class CatalogWidget extends StatelessWidget {
  final CatalogModel catalogModel;
  final VoidCallback onTap;
  const CatalogWidget({
    required this.catalogModel,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: catalogModel.color,
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 40,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                catalogModel.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$ ${catalogModel.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              onTap();
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
