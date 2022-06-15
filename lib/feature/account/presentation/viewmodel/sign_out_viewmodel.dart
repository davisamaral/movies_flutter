import 'package:movies_flutter/feature/account/domain/usecase/do_logout_use_case.dart';

class SignOutViewModel {
  const SignOutViewModel({required this.doLogout});

  final DoSignOutUseCase doLogout;
}
