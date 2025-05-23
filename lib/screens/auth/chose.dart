import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sporquify_app/screens/auth/login.dart';
import 'package:sporquify_app/screens/auth/register.dart';

import 'dart:math' as math;

class Chose extends StatelessWidget {
  const Chose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo principal
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginBillie.png'),
                fit: BoxFit.none,
                alignment: Alignment.bottomLeft,
              ),
            ),
          ),
          // Imagen superior derecha
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/Union.png',
              width: 150,
            ),
          ),
          // Imagen inferior derecha rotada -60 grados
          Positioned(
            bottom: 0,
            right: 0,
            child: Transform.rotate(
              angle: 120 * math.pi / 180, // Convertir grados a radianes
              child: Image.asset(
                'assets/Union.png',
              ),
            ),
          ),
          // Contenido principal
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 155),
                  // Logo
                  Center(
                    child: SvgPicture.asset(
                      'assets/Vector.svg',
                      height: 71,
                      width: 235,
                      colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                    )
                  ),
                  const SizedBox(height: 55),
                  // Título
                  Center(
                    child: Text(
                      'Enjoy Listening To Music',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Descripción
                  Text(
                    'Sporquify is a proprietary Swedish audio streaming and media services provider',
                    style: TextStyle(
                      fontSize: 19,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Botones
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Botón de registro
                      SizedBox(
                        width: 147,
                        height: 73,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      // Texto de inicio de sesión
                      SizedBox(
                        width: 147,
                        height: 73,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}