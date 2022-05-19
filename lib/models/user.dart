class User {
  final String email;
  final String? phoneNumber;
  final String password;

  User({
    required this.email,
    this.phoneNumber,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}
