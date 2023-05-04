import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'app/app_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  runApp(MyApp.getInstance());
}

Future<List<void>> _initializeApp() async {
  return await Future.wait([
    getInit(),
    _setVerticalOrientation(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);
}

Future<void> _setVerticalOrientation() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
