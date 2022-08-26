import 'package:nimble_simple/core/navigation/keys.dart';
import 'package:flutter/material.dart';
import 'package:nimble_simple/screens/login/root.dart';
import 'package:nimble_simple/screens/onboarding/onboardingScreen.dart';

import '../../screens/main/bottomNavi.dart';
import '../../screens/main/innerPages/detailScreen.dart';
import '../../screens/splash/root.dart';

Route generateRoute(RouteSettings settings) {
  String routeName = settings.name ?? '';

  switch (routeName) {
    case RouteKeys.routeSplash:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case RouteKeys.routeOnboarding:
      return MaterialPageRoute(builder: (_) => OnboardingScreen());
    case RouteKeys.routeLoginScreen:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case RouteKeys.routeBottomNavi:
      return MaterialPageRoute(builder: (_) => BottomNavi());
    case RouteKeys.routeDetailScreen:
      Map args = settings.arguments as Map;
      return MaterialPageRoute(builder: (_) => DetailScreen(data: args));


  //   Map args = settings.arguments as Map;
    //   return MaterialPageRoute(builder: (_) =>  RegistrationSuccessScreen(data: args,));
    default:
      return MaterialPageRoute(
          builder: (_) => _ErrorScreen(routeName: routeName));
  }
}

class _ErrorScreen extends StatelessWidget {
  final String routeName;
  const _ErrorScreen({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Route '$routeName' does not exist"),
      ),
    );
  }
}
