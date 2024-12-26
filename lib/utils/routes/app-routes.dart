
import 'package:flutter/material.dart';
import 'package:head_hunter/utils/routes/routes-name.dart';


import '../../view/auth/register-view.dart';
import '../../view/home/home-view.dart';
import '../../view/splash/splash-view.dart';
import '../../view/welcome/welcome-view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesNames.splashView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesNames.welcomeView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WelcomeView());
      case RoutesNames.registerView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterView());
      case RoutesNames.homeView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          );
        });
    }
  }
}
