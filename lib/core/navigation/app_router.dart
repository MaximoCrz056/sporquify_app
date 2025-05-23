import 'package:flutter/material.dart';
import 'package:sporquify_app/screens/splash_screen.dart';
import 'package:sporquify_app/screens/get_started.dart';
import 'package:sporquify_app/screens/auth/chose.dart';
import 'package:sporquify_app/screens/auth/login.dart';
import 'package:sporquify_app/screens/auth/register.dart';

class AppRouter {
  static const String splash = '/';
  static const String getStarted = '/get_started';
  static const String chose = '/chose';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _createRoute(const SplashScreen());
      case getStarted:
        return _createRoute(const GetStarted());
      case chose:
        return _createRoute(const Chose());
      case login:
        return _createRoute(const LoginScreen());
      case register:
        return _createRoute(const RegisterScreen());
      default:
        return _createRoute(
          Scaffold(
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static void navigateToAndClearStack(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
    );
  }

  static void navigateToReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}