class LoginResponseModel {
  final String token;
  final String message;
  final String status;
  LoginResponseModel({
    required this.token,
    required this.message,
    required this.status,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'],
      message: json['message'],
      status: json['status'],
    );
  }
}
