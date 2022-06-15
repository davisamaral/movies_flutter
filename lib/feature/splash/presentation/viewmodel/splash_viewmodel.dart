import 'package:movies_flutter/feature/account/domain/usecase/get_current_account_use_case.dart';

class SplashViewModel {
  SplashViewModel({required this.getCurrentAccount});

  final GetCurrentAccountUseCase getCurrentAccount;

  Future<bool> isUserLogged() {
    return getCurrentAccount().then((value) => value != null);
  }
}
