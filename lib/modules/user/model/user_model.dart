class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }
}


/*
{
  "id": 1,
  "email": "george.bluth@reqres.in",
  "first_name": "George",
  "last_name": "Bluth",
  "avatar": "https://reqres.in/img/faces/1-image.jpg"
}
*/