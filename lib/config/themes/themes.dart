import 'package:flutter/material.dart';

/// Centralized app theme following the clean, light style from the design.
///
/// Key characteristics:
/// - Calm blue primary color for CTAs
/// - White background with subtle grey borders
/// - Rounded corners on inputs and buttons
/// - Dense inputs with filled background
class AppTheme {
  // Brand colors per design
  static const _primary = Color(0xFF0B66B2); // Primary blue
  static const _secondary = Color(0xFF2AA7DF); // Accent
  static const _surface = Colors.white; // cards/inputs/appbar
  static const _scaffold = Color(0xFFF7FAFC); // soft off-white background
  static const _border = Color(0xFFE4E7EC);
  static const _hint = Color(0xFF98A2B3);

  static const double _radius = 12.0;

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,

      colorScheme: ColorScheme.fromSeed(
        seedColor: _primary,
        brightness: Brightness.light,
      ).copyWith(primary: _primary, secondary: _secondary, surface: _surface),
      scaffoldBackgroundColor: _scaffold,
      visualDensity: VisualDensity.standard,

    );

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: const BorderSide(color: _border, width: 1),
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: _surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: base.colorScheme.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_radius),
          ),
          elevation: 0,
          textStyle: base.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: base.colorScheme.primary,
          textStyle: base.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: _surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        hintStyle: base.textTheme.bodyMedium?.copyWith(color: _hint),
        prefixIconColor: _hint,
        suffixIconColor: _hint,
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: base.colorScheme.primary, width: 1.5),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: base.colorScheme.error, width: 1.5),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: base.colorScheme.error, width: 1.5),
        ),
      ),
      dividerColor: _border,

    );
  }
}
