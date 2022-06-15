import 'package:movies_flutter/feature/account/domain/model/account.dart';
import 'package:movies_flutter/feature/account/domain/repository/account_repository.dart';
import 'package:movies_flutter/feature/account/domain/usecase/get_current_account_use_case.dart';

class GetCurrentAccount implements GetCurrentAccountUseCase {
  const GetCurrentAccount({required this.repository});

  final AccountRepository repository;

  @override
  Future<Account?> call() {
    return repository.getCurrentAccount();
  }
}
