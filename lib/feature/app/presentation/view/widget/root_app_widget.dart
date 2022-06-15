import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_flutter/feature/account/presentation/view/page/sign_in_page.dart';
import 'package:movies_flutter/feature/account/presentation/view/page/sign_up_page.dart';
import 'package:movies_flutter/feature/movie/presentation/view/page/movie_list_page.dart';
import 'package:movies_flutter/feature/splash/presentation/view/page/splash_page.dart';
import 'package:movies_flutter/infrastructure/factory/feature/account/presentation/view/page/account_page_factory.dart';
import 'package:movies_flutter/infrastructure/factory/feature/movie/presentation/view/page/movie_page_factory.dart';
import 'package:movies_flutter/infrastructure/factory/feature/splash/presentation/view/page/splash_page_factory.dart';

class RootAppWidget extends StatelessWidget {
  const RootAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      initialRoute: SplashPage.id,
      routes: {
        SplashPage.id: (context) => makeSplashPage(),
        SignInPage.id: (context) => makeSignInPage(),
        SignUpPage.id: (context) => makeSignUpPage(),
        MovieListPage.id: (context) => makeMovieListPage(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', ''),
        Locale('en', ''),
      ],
    );
  }
}
