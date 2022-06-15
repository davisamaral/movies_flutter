import 'package:movies_flutter/feature/account/domain/repository/account_repository.dart';
import 'package:movies_flutter/feature/account/domain/usecase/do_logout_use_case.dart';

class DoLogout implements DoSignOutUseCase {
  const DoLogout({required this.repository});

  final AccountRepository repository;

  @override
  Future<void> call() {
    return repository.doLogout();
  }
}
