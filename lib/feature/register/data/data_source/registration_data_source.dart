import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/core/api_client.dart';
import 'package:registration_login/core/api_constant.dart';

import '../model/registration_model.dart';

abstract class RegistrationDataSource {
  Future<List<RegistrationModel>> postUser();
}

class RegistrationDataSourceIml implements RegistrationDataSource {
  RegistrationDataSourceIml(this.apiClient);
  ApiClient apiClient;

  @override
  Future<List<RegistrationModel>> postUser() async {
    final result = await apiClient.request(ApiConstant.register);
    List data = result;
    return data.map((e) => RegistrationModel.fromJson(e)).toList();
  }
}

final registrationdatasourceProvider = Provider<RegistrationDataSource>((ref) {
  return RegistrationDataSourceIml(ref.watch(apiClientProvider));
});
