import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/feature/login/data/data_source/login_data_source.dart';
import 'package:registration_login/feature/login/data/model/login_reponse_model.dart';
import 'package:registration_login/feature/login/data/model/login_request_model.dart';

import '../../../core/api_error.dart';

abstract class LoginRepository {
  Future<Either<AppError, LoginResponseModel>> postUser(
      {required LoginRequestModel loginRequestModel});
}

class LoginRepositoryIml implements LoginRepository {
  LoginRepositoryIml(this.loginDataSource);
  LoginDataSource loginDataSource;

  @override
  Future<Either<AppError, LoginResponseModel>> postUser(
      {required LoginRequestModel loginRequestModel}) async {
    try {
      final result =
          await loginDataSource.postUserr(loginRequestModel: loginRequestModel);
      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }
}

final loginrepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryIml(ref.watch(logindatasourceProvider));
});
