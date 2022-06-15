import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_flutter/feature/account/domain/model/account.dart';
import 'package:movies_flutter/feature/account/domain/repository/account_repository.dart';

class DefaultAccountRepository implements AccountRepository {
  const DefaultAccountRepository({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  Future<Account> createAccount(String email, String password) {
    return firebaseAuth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => Account(email: email));
  }

  @override
  Future<Account?> getCurrentAccount() {
    var email = firebaseAuth.currentUser?.email;
    return Future(() => email != null ? Account(email: email) : null);
  }

  @override
  Future<Account> doLogin(String email, String password) {
    return firebaseAuth
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => Account(email: email));
  }

  @override
  Future<void> doLogout() {
    return firebaseAuth.signOut();
  }
}
