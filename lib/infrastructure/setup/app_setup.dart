import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/infrastructure/setup/firebase_options.dart';

class AppSetup {
  static initialize() async {
    _initializeFlutterBindings();
    await _initializeFirebase();
  }

  static _initializeFlutterBindings() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  static _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
