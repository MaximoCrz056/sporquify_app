import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Paleta de colores principal - Spotify inspired
  static const Color primaryColor = Color(0xFF1DB954); // Spotify Green
  static const Color primaryVariant = Color(0xFF1ED760); // Bright Green
  static const Color secondaryColor = Color(0xFF191414); // Spotify Black
  static const Color secondaryVariant = Color(0xFF282828); // Dark Gray
  
  // Colores de superficie y fondo
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF0A0A0A);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);
  static const Color overlayLight = Color(0xFFF5F5F5);
  static const Color overlayDark = Color(0xFF2A2A2A);
  
  // Colores de texto optimizados
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryLight = Color(0xFF6C757D);
  static const Color textSecondaryDark = Color(0xFFB3B3B3);
  static const Color textTertiaryLight = Color(0xFF9E9E9E);
  static const Color textTertiaryDark = Color(0xFF757575);
  
  // Colores de estado mejorados
  static const Color errorColor = Color(0xFFE22134);
  static const Color warningColor = Color(0xFFFFB020);
  static const Color successColor = Color(0xFF1DB954);
  static const Color infoColor = Color(0xFF2196F3);
  
  // Colores adicionales para UI
  static const Color dividerLight = Color(0xFFE0E0E0);
  static const Color dividerDark = Color(0xFF424242);
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x3A000000);
  
  // Tema claro optimizado
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundLight,
      
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        onPrimary: Colors.white,
        primaryContainer: Color(0xFFE8F5E8),
        onPrimaryContainer: Color(0xFF002106),
        secondary: secondaryColor,
        onSecondary: Colors.white,
        secondaryContainer: overlayLight,
        onSecondaryContainer: textPrimaryLight,
        tertiary: primaryVariant,
        onTertiary: Colors.white,
        error: errorColor,
        onError: Colors.white,
        errorContainer: Color(0xFFFFDAD6),
        onErrorContainer: Color(0xFF410002),
        surface: surfaceLight,
        onSurface: textPrimaryLight,
        surfaceContainerHighest: overlayLight,
        onSurfaceVariant: textSecondaryLight,
        outline: dividerLight,
        outlineVariant: Color(0xFFE0E0E0),
        shadow: shadowLight,
        scrim: Colors.black,
        inverseSurface: surfaceDark,
        onInverseSurface: textPrimaryDark,
        inversePrimary: primaryVariant,
        surfaceTint: primaryColor,
      ),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: IconThemeData(color: textPrimaryLight),
        titleTextStyle: TextStyle(
          color: textPrimaryLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      cardTheme: CardTheme(
        color: cardLight,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimaryLight,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimaryLight,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textPrimaryLight,
        ),
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimaryLight,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryLight,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimaryLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: textPrimaryLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textSecondaryLight,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: textSecondaryLight,
        ),
      ),
    );
  }
  
  // Tema oscuro optimizado
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundDark,
      
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        onPrimary: Colors.black,
        primaryContainer: Color(0xFF003A16),
        onPrimaryContainer: Color(0xFFB8F397),
        secondary: secondaryVariant,
        onSecondary: Colors.white,
        secondaryContainer: overlayDark,
        onSecondaryContainer: textPrimaryDark,
        tertiary: primaryVariant,
        onTertiary: Colors.black,
        error: errorColor,
        onError: Colors.white,
        errorContainer: Color(0xFF93000A),
        onErrorContainer: Color(0xFFFFDAD6),
        surface: surfaceDark,
        onSurface: textPrimaryDark,
        surfaceContainerHighest: overlayDark,
        onSurfaceVariant: textSecondaryDark,
        outline: dividerDark,
        outlineVariant: Color(0xFF424242),
        shadow: shadowDark,
        scrim: Colors.black,
        inverseSurface: surfaceLight,
        onInverseSurface: textPrimaryLight,
        inversePrimary: primaryColor,
        surfaceTint: primaryColor,
      ),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: textPrimaryDark),
        titleTextStyle: TextStyle(
          color: textPrimaryDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      cardTheme: CardTheme(
        color: cardDark,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimaryDark,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimaryDark,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimaryDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: textPrimaryDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: textSecondaryDark,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: textSecondaryDark,
        ),
      ),
    );
  }
}