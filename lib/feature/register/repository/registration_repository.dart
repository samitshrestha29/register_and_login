import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/core/api_error.dart';
import 'package:registration_login/feature/register/data/data_source/registration_data_source.dart';
import 'package:registration_login/feature/register/data/model/register_response_model.dart';
import 'package:registration_login/feature/register/data/model/registration_request_model.dart';

abstract class RegistrationRepository {
  Future<Either<AppError, RegisterResponseModel>> postUser(
      {required RegistrationModel registrationModel});
}

class RegistrationRepositoryIml implements RegistrationRepository {
  RegistrationRepositoryIml(this.registrationDataSource);
  RegistrationDataSource registrationDataSource;

  @override
  Future<Either<AppError, RegisterResponseModel>> postUser(
      {required RegistrationModel registrationModel}) async {
    try {
      final result = await registrationDataSource.postUserr(
          registrationModel: registrationModel);
      return Right(result);
    } on DioError catch (e) {
      return Left(
        AppError(message: e.message),
      );
    }
  }
}

final registrationrepositoryProvider = Provider<RegistrationRepository>((ref) {
  return RegistrationRepositoryIml(ref.watch(registrationdatasourceProvider));
});
