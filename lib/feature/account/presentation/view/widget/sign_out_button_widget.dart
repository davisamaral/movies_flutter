import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_flutter/feature/account/presentation/view/page/sign_in_page.dart';
import 'package:movies_flutter/feature/account/presentation/viewmodel/sign_out_viewmodel.dart';

const int performSignOutResult = 1;
const int cancelResult = 0;

class SignOutButtonWidget extends StatelessWidget {
  const SignOutButtonWidget({
    required this.viewModel,
  }) : super(key: null);

  final SignOutViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    _checkUserSession(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {
          _showLogoutDialog(context).then((value) {
            _onLogoutDialogResult(value, context);
          });
        },
        child: const Icon(Icons.account_circle, size: 36.0),
      ),
    );
  }

  _onLogoutDialogResult(int? result, BuildContext context) {
    if (result == performSignOutResult) {
      _performSignOut(context);
    }
  }

  Future<int?> _showLogoutDialog(BuildContext context) async {
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.logoutDialogTitle ?? "",
        ),
        content: Text(
          AppLocalizations.of(context)?.logoutDialogMessage ?? "",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, cancelResult),
            child: Text(
              AppLocalizations.of(context)?.logoutDialogCancelButtonLabel ?? "",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, performSignOutResult);
            },
            child: Text(
              AppLocalizations.of(context)?.logoutDialogConfirmButtonLabel ??
                  "",
            ),
          ),
        ],
      ),
    );
  }

  _performSignOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    goToLoginScreen(context);
  }

  _checkUserSession(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        goToLoginScreen(context);
      });
    }
  }

  goToLoginScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, SignInPage.id, (r) => false);
  }
}
