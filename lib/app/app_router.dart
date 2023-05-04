import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../presentation/screens/home_page.dart';

class RouteNames {
  static const String homeRoute = '/home';
}

class AppRouter {
  static Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeRoute:
        return _smoothTransion(const HomePage());
    }
    return null;
  }

  static PageTransition _smoothTransion(Widget child) {
    return PageTransition(child: child, type: PageTransitionType.fade);
  }

  static String getIntialRoute() {
    return //sL<CachCubit>().isUser()?
        RouteNames.homeRoute
        //: RouteNames.authLogInRoute
        ;
  }
}
