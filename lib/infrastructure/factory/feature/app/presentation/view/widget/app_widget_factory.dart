import 'package:flutter/material.dart';
import 'package:movies_flutter/feature/app/presentation/view/widget/root_app_widget.dart';
import 'package:movies_flutter/infrastructure/factory/feature/account/presentation/view/page/account_page_factory.dart';

RootAppWidget makeRootAppWidget() {
  return const RootAppWidget();
}

AppBar makeLoggedAppBar() {
  return AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
    ),
    actions: [makeSignOutButtonWidget()],
    backgroundColor: Colors.black26,
    elevation: 0,
  );
}
