import 'package:flutter/material.dart';
import 'package:flutter_training/models/point_model.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PointModel> points = List.generate(
      40,
      (index) {
        return PointModel(
          id: 'TRANS_ID_$index',
          amount: double.parse(index.toString()),
          point: index * 10,
          dateTime: DateTime.now(),
        );
      },
    );

    return Scaffold(
      body: ListView.builder(
        itemCount: points.length,
        itemBuilder: (context, index) {
          final PointModel pointModel = points[index];
          return Container(
            height: 100,
            color: Colors.red.shade100,
            margin: const EdgeInsets.all(4),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(pointModel.id),
                Text(pointModel.point.toString()),
                Text(pointModel.amount.toString()),
                Text(pointModel.dateTime.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
