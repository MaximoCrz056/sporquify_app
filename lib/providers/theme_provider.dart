import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/theme/app_theme.dart';

enum CustomThemeType {
  spotify,
  classic,
  vibrant,
  minimal
}

class ThemeProvider extends ChangeNotifier {
  // Estado del tema
  ThemeMode _themeMode = ThemeMode.system;
  CustomThemeType _customTheme = CustomThemeType.spotify;
  bool _isAnimationEnabled = true;
  bool _isHighContrast = false;
  double _textScaleFactor = 1.0;
  
  // Claves para persistencia
  static const String _themeModeKey = 'theme_mode';
  static const String _customThemeKey = 'custom_theme';
  static const String _animationKey = 'animation_enabled';
  static const String _highContrastKey = 'high_contrast';
  static const String _textScaleKey = 'text_scale_factor';
  
  // Estado de carga
  bool _isLoading = false;
  String? _error;
  
  // Lazy loading de SharedPreferences
  SharedPreferences? _prefs;
  
  // Getters
  ThemeMode get themeMode => _themeMode;
  CustomThemeType get customTheme => _customTheme;
  bool get isAnimationEnabled => _isAnimationEnabled;
  bool get isHighContrast => _isHighContrast;
  double get textScaleFactor => _textScaleFactor;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  bool get isDarkMode {
    switch (_themeMode) {
      case ThemeMode.dark:
        return true;
      case ThemeMode.light:
        return false;
      case ThemeMode.system:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    }
  }
  
  bool get isLightMode => !isDarkMode;
  
  ThemeProvider() {
    _initializeTheme();
  }
  
  // Inicialización asíncrona
  Future<void> _initializeTheme() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      
      await _loadThemeSettings();
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Error al cargar configuración del tema: $e';
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Carga optimizada de configuraciones
  Future<void> _loadThemeSettings() async {
    _prefs ??= await SharedPreferences.getInstance();
    
    // Cargar modo de tema
    final themeModeString = _prefs!.getString(_themeModeKey);
    if (themeModeString != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (mode) => mode.name == themeModeString,
        orElse: () => ThemeMode.system,
      );
    }
    
    // Cargar tema personalizado
    final customThemeString = _prefs!.getString(_customThemeKey);
    if (customThemeString != null) {
      _customTheme = CustomThemeType.values.firstWhere(
        (theme) => theme.name == customThemeString,
        orElse: () => CustomThemeType.spotify,
      );
    }
    
    // Cargar otras configuraciones
    _isAnimationEnabled = _prefs!.getBool(_animationKey) ?? true;
    _isHighContrast = _prefs!.getBool(_highContrastKey) ?? false;
    _textScaleFactor = _prefs!.getDouble(_textScaleKey) ?? 1.0;
  }
  
  // Persistencia optimizada
  Future<void> _saveThemeSettings() async {
    try {
      _prefs ??= await SharedPreferences.getInstance();
      
      await Future.wait([
        _prefs!.setString(_themeModeKey, _themeMode.name),
        _prefs!.setString(_customThemeKey, _customTheme.name),
        _prefs!.setBool(_animationKey, _isAnimationEnabled),
        _prefs!.setBool(_highContrastKey, _isHighContrast),
        _prefs!.setDouble(_textScaleKey, _textScaleFactor),
      ]);
    } catch (e) {
      _error = 'Error al guardar configuración: $e';
      notifyListeners();
    }
  }
  
  // Cambio de modo de tema con animación
  Future<void> setThemeMode(ThemeMode themeMode, {bool animate = true}) async {
    if (_themeMode == themeMode) return;
    
    _themeMode = themeMode;
    _error = null;
    
    if (animate && _isAnimationEnabled) {
      await _triggerThemeTransition();
    }
    
    notifyListeners();
    await _saveThemeSettings();
  }
  
  // Cambio de tema personalizado
  Future<void> setCustomTheme(CustomThemeType customTheme) async {
    if (_customTheme == customTheme) return;
    
    _customTheme = customTheme;
    _error = null;
    notifyListeners();
    await _saveThemeSettings();
  }
  
  // Toggle mejorado con animación
  Future<void> toggleTheme({bool animate = true}) async {
    final newMode = _themeMode == ThemeMode.dark 
        ? ThemeMode.light 
        : ThemeMode.dark;
    
    await setThemeMode(newMode, animate: animate);
  }
  
  // Configuración de animaciones
  Future<void> setAnimationEnabled(bool enabled) async {
    if (_isAnimationEnabled == enabled) return;
    
    _isAnimationEnabled = enabled;
    notifyListeners();
    await _saveThemeSettings();
  }
  
  // Configuración de alto contraste
  Future<void> setHighContrast(bool enabled) async {
    if (_isHighContrast == enabled) return;
    
    _isHighContrast = enabled;
    notifyListeners();
    await _saveThemeSettings();
  }
  
  // Configuración de escala de texto
  Future<void> setTextScaleFactor(double factor) async {
    if (_textScaleFactor == factor) return;
    
    _textScaleFactor = factor.clamp(0.8, 2.0);
    notifyListeners();
    await _saveThemeSettings();
  }
  
  // Animación de transición de tema
  Future<void> _triggerThemeTransition() async {
    if (!_isAnimationEnabled) return;
    
    try {
      await HapticFeedback.lightImpact();
      // Aquí se puede agregar lógica adicional de animación
    } catch (e) {
      // Ignorar errores de haptic feedback en dispositivos que no lo soporten
    }
  }
  
  // Reset a configuración por defecto
  Future<void> resetToDefaults() async {
    _themeMode = ThemeMode.system;
    _customTheme = CustomThemeType.spotify;
    _isAnimationEnabled = true;
    _isHighContrast = false;
    _textScaleFactor = 1.0;
    _error = null;
    
    notifyListeners();
    await _saveThemeSettings();
  }
  
  // Limpiar error
  void clearError() {
    _error = null;
    notifyListeners();
  }
  
  // Obtener tema actual basado en configuraciones
  ThemeData getCurrentTheme(Brightness brightness) {
    ThemeData baseTheme = brightness == Brightness.dark 
        ? AppTheme.darkTheme 
        : AppTheme.lightTheme;
    
    // Aplicar modificaciones según configuraciones
    if (_isHighContrast) {
      baseTheme = _applyHighContrast(baseTheme);
    }
    
    if (_textScaleFactor != 1.0) {
      baseTheme = _applyTextScale(baseTheme);
    }
    
    return baseTheme;
  }
  
  // Aplicar alto contraste
  ThemeData _applyHighContrast(ThemeData theme) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: theme.brightness == Brightness.dark 
            ? Colors.white 
            : Colors.black,
        onPrimary: theme.brightness == Brightness.dark 
            ? Colors.black 
            : Colors.white,
      ),
    );
  }
  
  // Aplicar escala de texto
  ThemeData _applyTextScale(ThemeData theme) {
    return theme.copyWith(
      textTheme: theme.textTheme.apply(
        fontSizeFactor: _textScaleFactor,
      ),
    );
  }
}