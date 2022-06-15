import 'package:movies_flutter/feature/account/domain/usecase/create_account.dart';
import 'package:movies_flutter/feature/account/domain/usecase/create_account_use_case.dart';
import 'package:movies_flutter/feature/account/domain/usecase/do_login.dart';
import 'package:movies_flutter/feature/account/domain/usecase/do_login_use_case.dart';
import 'package:movies_flutter/feature/account/domain/usecase/do_logout.dart';
import 'package:movies_flutter/feature/account/domain/usecase/do_logout_use_case.dart';
import 'package:movies_flutter/feature/account/domain/usecase/get_current_account.dart';
import 'package:movies_flutter/feature/account/domain/usecase/get_current_account_use_case.dart';
import 'package:movies_flutter/infrastructure/factory/feature/account/domain/repository/account_repository_factory.dart';

DoSignInUseCase makeDoSignInUseCase() {
  return DoLogin(repository: makeAccountRepository());
}

DoSignOutUseCase makeDoSignOutUseCase() {
  return DoLogout(repository: makeAccountRepository());
}

GetCurrentAccountUseCase makeGetCurrentAccountUseCase() {
  return GetCurrentAccount(repository: makeAccountRepository());
}

CreateAccountUseCase makeCreateAccountUseCase() {
  return CreateAccount(repository: makeAccountRepository());
}
