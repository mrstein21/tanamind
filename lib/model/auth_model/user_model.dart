class UserModel {
  String token;
  User user;

  UserModel({this.token, this.user});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      user: User.fromJson(json['user'])
    );
  }
}

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  User({this.id, this.firstName, this.lastName, this.email, this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      email: json['email'],
      phoneNumber: json['phone'],
    );
  }
}
