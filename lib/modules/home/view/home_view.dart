import 'package:flutter/material.dart';
import 'package:flutter_training/modules/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../modules/user/view/user_view.dart';
import '../../../modules/home/view_model/home_view_model.dart';

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
          body: buildBody(currentIndex, context),
        );
      },
    );
  }

  Widget buildBody(int index, BuildContext context) {
    if (index == 0) {
      return Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: context.read<AuthViewModel>().clearData,
          child: const Text('Clear data'),
        ),
      );
    } else {
      return const UserView();
    }
  }
}
