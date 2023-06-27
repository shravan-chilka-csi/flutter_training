import 'package:flutter/material.dart';
import 'package:flutter_training/modules/user/model/user_model.dart';
import 'package:flutter_training/modules/user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class UserView extends StatelessWidget {
  const UserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<UserModel>?>(
        future: context.read<UserViewModel>().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final users = snapshot.requireData;
            if (users == null) {
              return const Text('No results found');
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: Image.network(user.avatar),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  trailing: Text(user.id.toString()),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
