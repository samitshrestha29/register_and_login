import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/core/api_error.dart';
import 'package:registration_login/feature/register/data/data_source/registration_data_source.dart';
import 'package:registration_login/feature/register/data/model/registration_model.dart';

abstract class RegistrationRepository {
  Future<Either<AppError, List<RegistrationModel>>> postUserr();
}

class RegistrationRepositoryIml implements RegistrationRepository {
  RegistrationRepositoryIml(this.registrationDataSource);
  RegistrationDataSource registrationDataSource;

  @override
  Future<Either<AppError, List<RegistrationModel>>> postUserr() async {
    try {
      final result = await registrationDataSource.postUser();
      return Right(result);
    } on DioError catch (e) {
      return left(
        AppError(message: e.message),
      );
    }
  }
}

final repositeoryProvider = Provider<RegistrationRepository>((ref) {
  return RegistrationRepositoryIml(ref.watch(registrationdatasourceProvider));
});
