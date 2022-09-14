import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registration_login/feature/data/model/registration_model.dart';
import 'package:registration_login/feature/register/repository/registration_repository.dart';

class RegistrationDataSourceNotifier
    extends StateNotifier<AsyncValue<List<RegistrationModel>>> {
  RegistrationDataSourceNotifier(this.registrationRepository)
      : super(const AsyncLoading()) {
    postuserr();
  }
  RegistrationRepository registrationRepository;
  postuserr() async {
    final data = await registrationRepository.postUser();
    data.fold(
      (l) => state = AsyncValue.error(l),
      (r) => state = AsyncError(r),
    );
  }
}

final registrationconrtolProvider = StateNotifierProvider<
    RegistrationDataSourceNotifier, AsyncValue<List<RegistrationModel>>>((ref) {
  return RegistrationDataSourceNotifier(
      ref.watch(registrationrepositoryProvider));
});
