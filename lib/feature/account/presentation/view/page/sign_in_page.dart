import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_flutter/feature/account/presentation/view/page/sign_up_page.dart';
import 'package:movies_flutter/feature/account/presentation/view/widget/sign_in_button_widget.dart';
import 'package:movies_flutter/feature/account/presentation/view/widget/sign_in_text_field_widget.dart';
import 'package:movies_flutter/feature/account/presentation/view/widget/sign_up_button_widget.dart';
import 'package:movies_flutter/feature/account/presentation/viewmodel/sign_in_viewmodel.dart';
import 'package:movies_flutter/feature/movie/presentation/view/page/movie_list_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({required this.viewModel, Key? key}) : super(key: key);

  static const String id = '/sign_in_screen';
  final SignInViewModel viewModel;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = '';
  String _password = '';
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
                      hint: AppLocalizations.of(context)?.signInEmailHint ?? "",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (newValue) => _setEmail(newValue),
                    ),
                    const SizedBox(height: 16),
                    AccountTextFieldWidget(
                      hint: AppLocalizations.of(context)?.signInPasswordHint ??
                          "",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      onChanged: (newValue) => _setPassword(newValue),
                    ),
                    const SizedBox(height: 32),
                    AccountButtonWidget(
                      label: AppLocalizations.of(context)
                              ?.signInEnterButtonLabel ??
                          "",
                      onPressed: () => doSignIn(),
                    ),
                    const SizedBox(height: 56),
                    SignUpButtonWidget(onTap: onSignUpButtonClicked),
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

  onSignUpButtonClicked() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamed(context, SignUpPage.id);
    });
  }

  doSignIn() async {
    setLoadingState(true);
    widget.viewModel.attemptSignIn(
      email: _email,
      password: _password,
      onSuccess: proceedToHomeScreen,
      onError: displayErrorOnSignIn,
    );
  }

  setLoadingState(bool isLoading) {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _isLoading = isLoading;
    });
  }

  proceedToHomeScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushNamedAndRemoveUntil(
          context, MovieListPage.id, (r) => false);
    });
  }

  displayErrorOnSignIn() {
    setLoadingState(false);
    displaySnackBarMessage(
      AppLocalizations.of(context)?.signInErrorMessage ?? "",
    );
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
