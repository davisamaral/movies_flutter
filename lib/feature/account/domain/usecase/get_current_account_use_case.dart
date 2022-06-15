import 'package:movies_flutter/feature/account/domain/model/account.dart';

abstract class GetCurrentAccountUseCase {
  Future<Account?> call();
}
