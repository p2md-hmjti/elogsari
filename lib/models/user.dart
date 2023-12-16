class User {
  int? id;
  String? username;
  String? email;
  String? token;

  User({
    this.id,
    this.username,
    this.email,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        username: json['user']['name'],
        email: json['user']['email'],
        token: json['token']);
  }
}
