import 'package:flutter/material.dart';
import 'package:movies_flutter/feature/account/presentation/view/page/sign_in_page.dart';
import 'package:movies_flutter/feature/movie/presentation/view/page/movie_list_page.dart';
import 'package:movies_flutter/feature/splash/presentation/viewmodel/splash_viewmodel.dart';

const int _animationDurationInMillis = 1200;
const int _animationStartDelayInMillis = 1000;

class SplashPage extends StatefulWidget {
  const SplashPage({required this.viewModel, Key? key}) : super(key: key);

  final SplashViewModel viewModel;

  static const String id = '/splash_page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _animationDuration =
      const Duration(milliseconds: _animationDurationInMillis);
  final _animationStartDelayDuration =
      const Duration(milliseconds: _animationStartDelayInMillis);
  final _animationDurationDelay = const Duration(
      milliseconds: _animationDurationInMillis + _animationDurationInMillis);

  double _scale = 0;
  bool _shouldClose = false;
  bool _isUserLogged = false;

  @override
  void initState() {
    super.initState();
    startOpenAnimation();
    verifySession();
  }

  verifySession() {
    Future.wait([
      widget.viewModel.isUserLogged(),
      Future.delayed(_animationDurationDelay),
    ]).then((value) {
      startFinishAnimation(value[0]);
    });
  }

  startOpenAnimation() async {
    await Future.delayed(
      _animationStartDelayDuration,
      () => setState(() {
        _scale = 1;
      }),
    );
  }

  startFinishAnimation(bool isUserLogged) {
    setState(() {
      _scale = 0;
      _shouldClose = true;
      _isUserLogged = isUserLogged;
    });
  }

  onAnimationFinish() {
    if (_shouldClose) {
      navigateToNextPage();
    }
  }

  navigateToNextPage() {
    if (_isUserLogged) {
      Navigator.pushNamedAndRemoveUntil(
          context, MovieListPage.id, (r) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, SignInPage.id, (r) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedScale(
                curve: const ElasticInOutCurve(),
                scale: _scale,
                duration: _animationDuration,
                onEnd: onAnimationFinish,
                child: Image.asset('assets/images/movie.png', height: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
