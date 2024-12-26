
import 'package:flutter/material.dart';
import 'package:head_hunter/bottomNav/bottomNav.dart';
import 'package:head_hunter/utils/routes/routes-name.dart';
import 'package:head_hunter/view/auth/choose-view.dart';
import 'package:head_hunter/view/auth/sign-in-view.dart';


import '../../view/auth/sign-up.dart';
import '../../view/bottom/home-view.dart';
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
      case RoutesNames.signUpView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
        case RoutesNames.signInView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInView());
      case RoutesNames.homeView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
        case RoutesNames.chooseView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChooseView());
        case RoutesNames.bottomNav:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BottomNavView());

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
