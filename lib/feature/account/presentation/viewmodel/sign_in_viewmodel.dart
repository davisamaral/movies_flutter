import 'package:movies_flutter/feature/account/domain/usecase/do_login_use_case.dart';

class SignInViewModel {
  SignInViewModel({
    required this.doSignIn,
  });

  final DoSignInUseCase doSignIn;

  attemptSignIn({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function() onError,
  }) async {
    try {
      var result = await doSignIn(email, password);
      if (result == null) {
        onError();
      } else {
        onSuccess();
      }
    } catch (error) {
      onError();
    }
  }
}
