import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/core/api_client.dart';
import 'package:registration_login/core/api_constant.dart';
import 'package:registration_login/feature/register/data/model/register_response_model.dart';

import '../model/registration_request_model.dart';

abstract class RegistrationDataSource {
  Future<RegisterResponseModel> postUser(
      {required RegistrationModel registrationModel});
}

class RegistrationDataSourceIml implements RegistrationDataSource {
  RegistrationDataSourceIml(this.apiClient);
  ApiClient apiClient;

  @override
  Future<RegisterResponseModel> postUser(
      {required RegistrationModel registrationModel}) async {
    final result = await apiClient.request(
        endpoint: ApiConstant.register,
        type: 'post',
        data: registrationModel.toJson());
    return RegisterResponseModel.fromJson(result);
  }
}

final registrationdatasourceProvider = Provider<RegistrationDataSource>((ref) {
  return RegistrationDataSourceIml(ref.watch(apiClientProvider));
});
