import 'package:movies_flutter/feature/account/presentation/view/page/sign_in_page.dart';
import 'package:movies_flutter/feature/account/presentation/view/page/sign_up_page.dart';
import 'package:movies_flutter/feature/account/presentation/view/widget/sign_out_button_widget.dart';
import 'package:movies_flutter/infrastructure/factory/feature/account/presentation/viewmodel/account_viewmodel_factory.dart';

SignInPage makeSignInPage() {
  return SignInPage(viewModel: makeSignInViewModel());
}

SignUpPage makeSignUpPage() {
  return SignUpPage(viewModel: makeSignUpViewModel());
}

SignOutButtonWidget makeSignOutButtonWidget() {
  return SignOutButtonWidget(viewModel: makeSignOutViewModel());
}
