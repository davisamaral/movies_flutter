import 'package:flutter/material.dart';
import 'package:movies_flutter/infrastructure/setup/app_setup.dart';
import 'package:movies_flutter/infrastructure/factory/feature/app/presentation/view/widget/app_widget_factory.dart';

void main() async {
  await AppSetup.initialize();
  runApp(makeRootAppWidget());
}
