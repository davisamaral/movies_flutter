import 'package:movies_flutter/feature/account/domain/model/account.dart';
import 'package:movies_flutter/feature/account/domain/repository/account_repository.dart';
import 'package:movies_flutter/feature/account/domain/usecase/create_account_use_case.dart';

class CreateAccount implements CreateAccountUseCase {
  const CreateAccount({required this.repository});

  final AccountRepository repository;

  @override
  Future<Account?> call(String username, String password) {
    return repository.createAccount(username, password);
  }
}
