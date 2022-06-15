import 'package:movies_flutter/feature/account/presentation/viewmodel/sign_in_viewmodel.dart';
import 'package:movies_flutter/feature/account/presentation/viewmodel/sign_out_viewmodel.dart';
import 'package:movies_flutter/feature/account/presentation/viewmodel/sign_up_viewmodel.dart';
import 'package:movies_flutter/infrastructure/factory/feature/account/domain/usecase/account_use_case_factory.dart';

SignInViewModel makeSignInViewModel() {
  return SignInViewModel(
    doSignIn: makeDoSignInUseCase(),
  );
}

SignUpViewModel makeSignUpViewModel() {
  return SignUpViewModel(
    createAccount: makeCreateAccountUseCase(),
  );
}

SignOutViewModel makeSignOutViewModel() {
  return SignOutViewModel(doLogout: makeDoSignOutUseCase());
}
