import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_training/modules/user/model/user_model.dart';
import 'package:http/http.dart';

class UserViewModel extends ChangeNotifier {
  final client = Client();

  Future<List<UserModel>?> getUsers() async {
    final uri = Uri.parse('https://reqres.in/api/users');
    final response = await client.get(
      uri,
      headers: {
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final jsonString = response.body;
      final result = json.decode(jsonString) as Map<String, dynamic>;
      final list = result['data'] as List<dynamic>;
      final users = list.map(
        (map) {
          return UserModel.fromMap(map as Map<String, dynamic>);
        },
      ).toList();
      return users;
    }
    return null;
  }
}
