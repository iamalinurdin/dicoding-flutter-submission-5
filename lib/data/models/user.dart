class User {
  final String name;
  final String userId;
  final String token;

  User({
    required this.name,
    required this.userId,
    required this.token
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(name: map['name'], userId: map['userId'], token: map['token']);
  }
}