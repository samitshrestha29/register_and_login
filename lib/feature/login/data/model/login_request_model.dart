class Login {
  final String email;
  final String password;
  Login({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
