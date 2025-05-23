import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporquify_app/providers/theme_provider.dart';
import 'package:sporquify_app/screens/auth/chose.dart';
import 'package:sporquify_app/screens/auth/login.dart';
import 'package:sporquify_app/screens/auth/register.dart';
import 'package:sporquify_app/screens/get_started.dart';
import 'package:sporquify_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Sporquify',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.getCurrentTheme(Brightness.light),
            darkTheme: themeProvider.getCurrentTheme(Brightness.dark),
            themeMode: themeProvider.themeMode,
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
      ),
    );
  }
}
