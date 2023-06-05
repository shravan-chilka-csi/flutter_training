import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final String imageUrl =
      'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=726&q=80';

  int quantityAdded = 0;

  void addClickEvent() {
    setState(() {
      quantityAdded++;
    });
  }

  void removeClickEvent() {
    setState(() {
      if (quantityAdded > 0) {
        quantityAdded--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 140,
            height: 140,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Macbook Pro',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const Text('M2 Chip, 8 GB Ram'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      removeClickEvent();
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 16),
                  Text(quantityAdded.toString()),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      addClickEvent();
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
