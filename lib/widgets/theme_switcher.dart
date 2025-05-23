import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class ThemeSwitcher extends StatelessWidget {
  final bool showLabel;
  final IconData? lightIcon;
  final IconData? darkIcon;
  final IconData? systemIcon;
  final EdgeInsetsGeometry? padding;
  
  const ThemeSwitcher({
    super.key,
    this.showLabel = true,
    this.lightIcon,
    this.darkIcon,
    this.systemIcon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        if (themeProvider.isLoading) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        return Container(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Botón tema claro
              _ThemeButton(
                icon: lightIcon ?? Icons.light_mode_outlined,
                isSelected: themeProvider.themeMode == ThemeMode.light,
                onPressed: () => themeProvider.setThemeMode(ThemeMode.light),
                tooltip: 'Tema claro',
              ),
              const SizedBox(width: 4),
              
              // Botón tema sistema
              _ThemeButton(
                icon: systemIcon ?? Icons.brightness_auto_outlined,
                isSelected: themeProvider.themeMode == ThemeMode.system,
                onPressed: () => themeProvider.setThemeMode(ThemeMode.system),
                tooltip: 'Tema del sistema',
              ),
              const SizedBox(width: 4),
              
              // Botón tema oscuro
              _ThemeButton(
                icon: darkIcon ?? Icons.dark_mode_outlined,
                isSelected: themeProvider.themeMode == ThemeMode.dark,
                onPressed: () => themeProvider.setThemeMode(ThemeMode.dark),
                tooltip: 'Tema oscuro',
              ),
              
              if (showLabel) ...[
                const SizedBox(width: 12),
                Text(
                  _getThemeLabel(themeProvider.themeMode),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _getThemeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Claro';
      case ThemeMode.dark:
        return 'Oscuro';
      case ThemeMode.system:
        return 'Sistema';
    }
  }
}

class _ThemeButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onPressed;
  final String tooltip;

  const _ThemeButton({
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Tooltip(
      message: tooltip,
      child: Material(
        color: isSelected 
            ? theme.colorScheme.primaryContainer
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              size: 20,
              color: isSelected
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

// Widget simplificado para toggle rápido
class QuickThemeToggle extends StatelessWidget {
  final double? size;
  final Color? activeColor;
  final Color? inactiveColor;
  
  const QuickThemeToggle({
    super.key,
    this.size,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDark = themeProvider.isDarkMode;
        final theme = Theme.of(context);
        
        return IconButton(
          onPressed: () => themeProvider.toggleTheme(),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey(isDark),
              size: size ?? 24,
              color: isDark 
                  ? (activeColor ?? theme.colorScheme.primary)
                  : (inactiveColor ?? theme.colorScheme.onSurfaceVariant),
            ),
          ),
          tooltip: isDark ? 'Cambiar a tema claro' : 'Cambiar a tema oscuro',
        );
      },
    );
  }
}

// Widget para configuraciones avanzadas de tema
class ThemeSettingsPanel extends StatelessWidget {
  const ThemeSettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración de Tema',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            // Selector de modo de tema
            const ThemeSwitcher(),
            const SizedBox(height: 16),
            
            // Configuración de animaciones
            SwitchListTile(
              title: const Text('Animaciones de transición'),
              subtitle: const Text('Habilitar animaciones al cambiar tema'),
              value: themeProvider.isAnimationEnabled,
              onChanged: themeProvider.setAnimationEnabled,
            ),
            
            // Configuración de alto contraste
            SwitchListTile(
              title: const Text('Alto contraste'),
              subtitle: const Text('Mejorar visibilidad con colores de alto contraste'),
              value: themeProvider.isHighContrast,
              onChanged: themeProvider.setHighContrast,
            ),
            
            // Escala de texto
            ListTile(
              title: const Text('Tamaño de texto'),
              subtitle: Text('Factor: ${themeProvider.textScaleFactor.toStringAsFixed(1)}x'),
            ),
            Slider(
              value: themeProvider.textScaleFactor,
              min: 0.8,
              max: 2.0,
              divisions: 12,
              label: '${themeProvider.textScaleFactor.toStringAsFixed(1)}x',
              onChanged: themeProvider.setTextScaleFactor,
            ),
            
            const SizedBox(height: 16),
            
            // Botón de reset
            ElevatedButton(
              onPressed: () async {
                await themeProvider.resetToDefaults();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Configuración restaurada a valores por defecto'),
                    ),
                  );
                }
              },
              child: const Text('Restaurar valores por defecto'),
            ),
            
            // Mostrar errores si existen
            if (themeProvider.error != null) ...[
              const SizedBox(height: 16),
              Card(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          themeProvider.error!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: themeProvider.clearError,
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}