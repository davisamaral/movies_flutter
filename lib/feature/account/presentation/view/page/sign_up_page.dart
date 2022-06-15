import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_flutter/feature/account/presentation/view/widget/sign_in_button_widget.dart';
import 'package:movies_flutter/feature/account/presentation/view/widget/sign_in_text_field_widget.dart';
import 'package:movies_flutter/feature/account/presentation/viewmodel/sign_up_viewmodel.dart';
import 'package:movies_flutter/feature/movie/presentation/view/page/movie_list_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({required this.viewModel, Key? key}) : super(key: key);

  static const String id = '/sign_up_screen';
  final SignUpViewModel viewModel;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = '';
  String _password = '';
  String _repeatedPassword = '';
  bool _isLoading = false;

  _setEmail(String newValue) {
    setState(() {
      _email = newValue;
    });
  }

  _setPassword(String newValue) {
    setState(() {
      _password = newValue;
    });
  }

  _setRepeatedPassword(String newValue) {
    setState(() {
      _repeatedPassword = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Image.asset('assets/images/movie.png', height: 160),
                    const SizedBox(height: 40),
                    AccountTextFieldWidget(
                      hint: AppLocalizations.of(context)?.signUpEmailHint ?? "",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (newValue) => _setEmail(newValue),
                    ),
                    const SizedBox(height: 36),
                    AccountTextFieldWidget(
                      hint: AppLocalizations.of(context)?.signUpPasswordHint ??
                          "",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (newValue) => _setPassword(newValue),
                    ),
                    const SizedBox(height: 8),
                    AccountTextFieldWidget(
                      hint: AppLocalizations.of(context)
                              ?.signUpRepeatPasswordHint ??
                          "",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (newValue) => _setRepeatedPassword(newValue),
                    ),
                    const SizedBox(height: 32),
                    AccountButtonWidget(
                      label: AppLocalizations.of(context)
                              ?.signUpRegisterButtonLabel ??
                          "",
                      onPressed: () => doSignUp(),
                    ),
                    const SizedBox(height: 56),
                  ],
                ),
              ),
              if (_isLoading)
                Container(
                  color: Colors.black38,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  setLoadingState(bool isLoading) {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _isLoading = isLoading;
    });
  }

  doSignUp() async {
    setLoadingState(true);
    widget.viewModel.doSignUp(
      appLocalizations: AppLocalizations.of(context),
      email: _email,
      password: _password,
      repeatedPassword: _repeatedPassword,
      onSuccess: proceedToHomeScreen,
      onError: displayErrorOnSignUp,
    );
  }

  proceedToHomeScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
          context, MovieListPage.id, (r) => false);
    });
  }

  displayErrorOnSignUp(String message) {
    setLoadingState(false);
    displaySnackBarMessage(message);
  }

  displaySnackBarMessage(String message) {
    var snackBar = SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 1000),
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
