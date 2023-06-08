import 'package:flutter/material.dart';
import 'package:flutter_training/models/catalog_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogWidget extends StatelessWidget {
  final CatalogModel catalogModel;
  final String label;
  final VoidCallback onTap;
  const CatalogWidget({
    required this.label,
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
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: GoogleFonts.lato().fontFamily,
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
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
