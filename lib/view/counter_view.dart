import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_training/view_model/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  const CounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log('build method called');
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red.shade100,
              alignment: Alignment.center,
              child: Selector<CounterViewModel, int>(
                selector: (context, counterViewModel) =>
                    counterViewModel.counterOne,
                builder: (context, counterOne, child) {
                  log('build method from counterOne');
                  return Text(
                    counterOne.toString(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green.shade100,
              alignment: Alignment.center,
              child: Selector<CounterViewModel, int>(
                selector: (context, counterViewModel) =>
                    counterViewModel.counterTwo,
                builder: (context, counterTwo, child) {
                  log('build method from counterTwo');
                  return Text(
                    counterTwo.toString(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.extended(
            label: const Text('Counter One'),
            onPressed: () {
              context.read<CounterViewModel>().incrementCounterOne();
            },
            icon: const Icon(Icons.add),
          ),
          FloatingActionButton.extended(
            label: const Text('Counter Two'),
            onPressed: () {
              context.read<CounterViewModel>().incrementCounterTwo();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
