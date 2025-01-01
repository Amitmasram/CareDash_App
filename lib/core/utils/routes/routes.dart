import 'package:CareDash/view/mainHome/main_home_screen.dart';
import 'package:CareDash/view/verify/otp_verify_screen.dart';
import 'package:flutter/material.dart';

import '../../../view/login/continue_screen.dart';

import '../../../view/onboarding/splash_screen.dart';
import 'routes_name.dart';

/// A class that handles generating routes for the app.
///
/// This class uses the MaterialPageRoute to generate routes for the app.
/// It checks the name of the route and returns the corresponding screen.
/// If no route is defined, it returns a default screen with a message.
class Routes {
  /// Generates a route based on the given RouteSettings.
  ///
  /// This function takes a RouteSettings object as input and returns a MaterialPageRoute.
  /// It checks the name of the route in the settings and returns the corresponding screen.
  /// If no route is defined, it returns a default screen with a message.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;

    // Check the name of the route
    switch (settings.name) {
      // If the route is for the splash screen, return a MaterialPageRoute with the SplashScreen as the builder
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const ContinueScreen());
      case RoutesName.verify:
        return MaterialPageRoute(builder: (context) => OTPScreen());

      case RoutesName.mainhome:
        return MaterialPageRoute(builder: (context) => MainHomeScreen());

      // If no route is defined, return a MaterialPageRoute with a default screen
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
