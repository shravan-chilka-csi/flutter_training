import 'package:flutter/material.dart';
import 'package:flutter_training/models/point_model.dart';

class PointsView extends StatelessWidget {
  const PointsView({
    super.key,
  });

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
      appBar: AppBar(
        title: const Text('Points'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.green.shade400,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.star_rate_rounded,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  const Text(
                    'Your Points',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.yellow,
                        child: Center(
                          child: Icon(
                            Icons.star_rate_rounded,
                            color: Colors.green.shade400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '700 points',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.maxFinite,
                    color: Colors.black,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: const Text(
                      'Last update: 5 March, 2023',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: points.length,
                itemBuilder: (context, index) {
                  final PointModel pointModel = points[index];
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
