import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_flutter/feature/account/domain/usecase/create_account_use_case.dart';

class SignUpViewModel {
  SignUpViewModel({
    required this.createAccount,
  });

  final CreateAccountUseCase createAccount;

  doSignUp({
    required AppLocalizations? appLocalizations,
    required String email,
    required String password,
    required String repeatedPassword,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    var genericErrorMessage = appLocalizations?.signUpErrorMessageText ?? "";
    try {
      var validationErrorMessage = getFormValidationErrorMessage(
        appLocalizations: appLocalizations,
        email: email,
        password: password,
        repeatedPassword: repeatedPassword,
      );
      if (validationErrorMessage != null) {
        onError(validationErrorMessage);
        return;
      }
      var result = await createAccount(email, password);
      if (result == null) {
        onError(genericErrorMessage);
      } else {
        onSuccess();
      }
    } catch (error) {
      onError(genericErrorMessage);
    }
  }

  String? getFormValidationErrorMessage({
    required AppLocalizations? appLocalizations,
    required String email,
    required String password,
    required String repeatedPassword,
  }) {
    if (email.isEmpty || password.isEmpty || repeatedPassword.isEmpty) {
      return appLocalizations?.signUpRequiredFieldsErrorMessageText ?? "";
    }
    if (!email.isValidEmail()) {
      return appLocalizations?.signUpInvalidEmailErrorMessageText ?? "";
    }
    if (password != repeatedPassword) {
      return appLocalizations?.signUpInvalidRepeatedPasswordErrorMessageText ??
          "";
    }
    return null;
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
