import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BillieEilishCyan.jpg'),
            colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.7), BlendMode.darken),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Botón para cambiar el tema
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, child) {
                        return IconButton(
                          icon: Icon(
                            themeProvider.isDarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            themeProvider.toggleTheme();
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/Vector.svg',
                      height: 59,
                      width: 196,
                      colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 21),
                Text(
                  'Experience the best quality music with Sporquify. Discover new songs and create your own playlists. So lets get started!',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                // Get Started button
                SizedBox(
                  width: double.infinity,
                  height: 92,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/chose');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}