import 'package:movies_flutter/feature/account/domain/model/account.dart';

abstract class CreateAccountUseCase {
  Future<Account?> call(String username, String password);
}
