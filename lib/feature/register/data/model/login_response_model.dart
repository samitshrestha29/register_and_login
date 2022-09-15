class RegisterResponseModel {
  final String messege;
  final String token;
  final String status;
  final int id;
  RegisterResponseModel({
    required this.messege,
    required this.token,
    required this.status,
    required this.id,
  });
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      messege: json['messege'],
      token: json['token'],
      status: json['status'],
      id: json['id'],
    );
  }
}
