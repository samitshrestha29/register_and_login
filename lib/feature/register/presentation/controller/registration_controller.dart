import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/Nextpage.dart';
import 'package:registration_login/commons/commons.dart';
import 'package:registration_login/feature/register/repository/registration_repository.dart';
import '../../data/model/register_response_model.dart';
import '../../data/model/registration_model.dart';

class RegistrationDataSourceNotifier
    extends StateNotifier<AsyncValue<RegisterResponseModel>> {
  RegistrationDataSourceNotifier(this.registrationRepository)
      : super(const AsyncValue.loading());
  RegistrationRepository registrationRepository;
  postuserr(RegistrationModel registrationModel, BuildContext context) async {
    final data = await registrationRepository.postUser(
        registrationModel: registrationModel);
    return data.fold(
      (l) {
        return snackbar(context, l.message, Colors.red);
      },
      (r) {
        navigaton(context, const Nextpage());

        return snackbar(context, r.messege, Colors.green);
      },
    );
  }
}

final registrationconrtolProvider = StateNotifierProvider<
    RegistrationDataSourceNotifier, AsyncValue<RegisterResponseModel>>((ref) {
  return RegistrationDataSourceNotifier(
      ref.watch(registrationrepositoryProvider));
});
