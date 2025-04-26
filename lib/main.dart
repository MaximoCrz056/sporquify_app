import 'package:flutter/material.dart';
import 'package:sporquify_app/screens/auth/chose.dart';
import 'package:sporquify_app/screens/auth/login.dart';
import 'package:sporquify_app/screens/auth/register.dart';
import 'package:sporquify_app/screens/get_started.dart';
import 'package:sporquify_app/screens/splash_screen.dart';
import 'package:sporquify_app/utilities/theme/color_scheme.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'Sporquify',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: LightTheme.primary,
            scaffoldBackgroundColor: LightTheme.background,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: LightTheme.blackText),
              bodyMedium: TextStyle(color: LightTheme.secondaryText),
              bodySmall: TextStyle(color: LightTheme.tertiaryText),
            ),
            colorScheme: const ColorScheme.light(
              primary: LightTheme.primary,
              surface: LightTheme.background,
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: DarkTheme.primary,
            scaffoldBackgroundColor: DarkTheme.background,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: DarkTheme.whiteText),
              bodyMedium: TextStyle(color: DarkTheme.secondaryText),
              bodySmall: TextStyle(color: DarkTheme.tertiaryText),
            ),
            colorScheme: const ColorScheme.dark(
              primary: DarkTheme.primary,
              surface: DarkTheme.background,
            ),
          ),
          themeMode: currentMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/get_started': (context) => const GetStarted(),
            '/chose': (context) => const Chose(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
          },
        );
      },
    );
  }
}
