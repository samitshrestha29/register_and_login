import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/core/api_constant.dart';
import 'package:registration_login/feature/login/data/model/login_reponse_model.dart';
import 'package:registration_login/feature/login/data/model/login_request_model.dart';

import '../../../../core/api_client.dart';

abstract class LoginDataSource {
  Future<LoginResponseModel> postUserr(
      {required LoginRequestModel loginRequestModel});
}

class LoginDataSourceIml implements LoginDataSource {
  LoginDataSourceIml(this.apiClient);
  ApiClient apiClient;

  @override
  Future<LoginResponseModel> postUserr(
      {required LoginRequestModel loginRequestModel}) async {
    final result = await apiClient.request(
      endpoint: ApiConstant.login,
      type: 'post',
      data: loginRequestModel.toJson(),
    );
    return LoginResponseModel.fromJson(result);
  }
}

final logindatasourceProvider = Provider<LoginDataSource>((ref) {
  return LoginDataSourceIml(ref.watch(apiClientProvider));
});
