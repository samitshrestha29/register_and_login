import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/Nextpage.dart';
import 'package:registration_login/commons/commons.dart';
import 'package:registration_login/feature/login/data/model/login_reponse_model.dart';
import 'package:registration_login/feature/login/data/model/login_request_model.dart';
import 'package:registration_login/feature/login/repository/login_repository_controller.dart';

class LoginDataSourceNotifier
    extends StateNotifier<AsyncValue<LoginResponseModel>> {
  LoginDataSourceNotifier(this.loginRepository)
      : super(const AsyncValue.loading());
  LoginRepository loginRepository;
  postuserr(LoginRequestModel loginRequestModel, BuildContext context) async {
    final data =
        await loginRepository.postUser(loginRequestModel: loginRequestModel);
    return data.fold(
      (l) {
        return snackbar(context, l.message, Colors.red);
      },
      (r) {
        navigaton(context, const Nextpage());

        return snackbar(context, r.message, Colors.green);
      },
    );
  }
}

final loginconrtolProvider = StateNotifierProvider<LoginDataSourceNotifier,
    AsyncValue<LoginResponseModel>>((ref) {
  return LoginDataSourceNotifier(ref.watch(loginrepositoryProvider));
});
