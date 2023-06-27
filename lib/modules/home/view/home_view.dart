import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_training/modules/home/view_model/home_view_model.dart';
import 'package:flutter_training/modules/user/view/user_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, int>(
      selector: (context, homeViewModel) => homeViewModel.currentIndex,
      builder: (context, currentIndex, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'User',
                icon: Icon(Icons.person),
              ),
            ],
            currentIndex: currentIndex,
            onTap: context.read<HomeViewModel>().onPageChangeEvent,
          ),
          body: buildBody(currentIndex),
        );
      },
    );
  }

  Widget buildBody(int index) {
    if (index == 0) {
      return Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(index.toString()),
      );
    } else {
      return const UserView();
    }
  }
}
