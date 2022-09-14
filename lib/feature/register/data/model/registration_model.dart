class RegistrationModel {
  final String name;
  final String email;
  final String password;
  final String repassword;
  RegistrationModel({
    required this.name,
    required this.email,
    required this.password,
    required this.repassword,
  });
  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      repassword: json['password confirmation'],
    );
  }
}
