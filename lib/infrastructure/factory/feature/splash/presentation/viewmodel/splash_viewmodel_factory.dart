import 'package:movies_flutter/feature/splash/presentation/viewmodel/splash_viewmodel.dart';
import 'package:movies_flutter/infrastructure/factory/feature/account/domain/usecase/account_use_case_factory.dart';

SplashViewModel makeSplashViewModel() {
  return SplashViewModel(getCurrentAccount: makeGetCurrentAccountUseCase());
}
