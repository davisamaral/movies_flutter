import 'package:movies_flutter/feature/account/domain/model/account.dart';
import 'package:movies_flutter/feature/account/domain/repository/account_repository.dart';
import 'package:movies_flutter/feature/account/domain/usecase/do_login_use_case.dart';

class DoLogin implements DoSignInUseCase {
  const DoLogin({required this.repository});

  final AccountRepository repository;

  @override
  Future<Account?> call(String username, String password) {
    return repository.doLogin(username, password);
  }
}
