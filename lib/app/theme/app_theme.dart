import 'package:flutter/material.dart';
import './app_radius.dart';

abstract final class AppTheme {
  static ThemeData light = _buildTheme(_lightColorTheme);

  static final ColorScheme _lightColorTheme =
      ColorScheme.fromSeed(
        seedColor: const Color(0xFF6C79FA),
        brightness: Brightness.light,
      ).copyWith(
        primary: Colors.blue, // 대표 색 (버튼 등)
        onPrimary: Colors.white, // primary 위의 글자색
        surface: Colors.white, // 화면/카드 배경
        onSurface: const Color(0xFF1A1C29), // 기본 글자색
        onSurfaceVariant: const Color(0xFF6B7280), // 설명 글자색
        outlineVariant: const Color(0xFFE5E7EB), // 테두리 색
        surfaceContainerHighest: const Color(0xFFF9FAFC),
      );

  static ThemeData _buildTheme(ColorScheme colorScheme) {
    final textTheme = _buildTextTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
      inputDecorationTheme: _buildInputDecorationTheme(colorScheme, textTheme),
    );
  }

  static TextTheme _buildTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: colorScheme.onSurfaceVariant,
        height: 1.5,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: colorScheme.onPrimary,
      ),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      hintStyle: textTheme.bodyMedium,
      suffixStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
      border: _inputBorder(colorScheme),
    );
  }

  static OutlineInputBorder _inputBorder(ColorScheme colorScheme) {
    return OutlineInputBorder(
      borderRadius: AppRadius.medium,
      borderSide: BorderSide.none,
    );
  }
}
