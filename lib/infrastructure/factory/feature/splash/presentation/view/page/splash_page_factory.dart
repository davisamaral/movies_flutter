import 'package:movies_flutter/feature/splash/presentation/view/page/splash_page.dart';
import 'package:movies_flutter/infrastructure/factory/feature/splash/presentation/viewmodel/splash_viewmodel_factory.dart';

SplashPage makeSplashPage() {
  return SplashPage(viewModel: makeSplashViewModel());
}
