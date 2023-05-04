import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/resources/string_manager.dart';
import '../presentation/resources/themes_manager.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _myApp = MyApp._internal();

  static MyApp getInstance() => _myApp;

  @override
  Widget build(BuildContext context) {
    return _initializeScreenUtil(
      MaterialApp(
        title: StringManager.appTitle,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.getIntialRoute(),
        onGenerateRoute: AppRouter.getRoute,
        theme: ThemeManager.getLightTheme(),
      ),
    );
  }
}

Widget _initializeScreenUtil(Widget widget) {
  return ScreenUtilInit(
    designSize: const Size(100, 100),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => widget,
  );
}
