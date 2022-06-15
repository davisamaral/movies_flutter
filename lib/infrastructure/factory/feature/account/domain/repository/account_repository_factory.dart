import 'package:movies_flutter/feature/account/data/repository/default_account_repository.dart';
import 'package:movies_flutter/feature/account/domain/repository/account_repository.dart';
import 'package:movies_flutter/infrastructure/factory/library/firebase/firebase_factory.dart';

AccountRepository makeAccountRepository() {
  return DefaultAccountRepository(firebaseAuth: makeFirebaseAuth());
}
