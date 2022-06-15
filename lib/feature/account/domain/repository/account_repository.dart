import 'package:movies_flutter/feature/account/domain/model/account.dart';

abstract class AccountRepository {
  Future<Account> createAccount(String email, String password);

  Future<Account?> getCurrentAccount();

  Future<Account> doLogin(String email, String password);

  Future<void> doLogout();
}
