import 'package:flutter/material.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return  PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme = ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onError,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          shadowColor: colorScheme.onPrimary,
          elevation: 12,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.blueGray50,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.blueGray50,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.lightBlueA700,
            fontSize: 17,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 14,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray500,
          fontSize: 12,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.black90001,
          fontSize: 64,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          color: colorScheme.primary,
          fontSize: 40,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 24,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: appTheme.blueGray100,
          fontSize: 10,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: const TextStyle(
          color: Color(0XFF040415),
          fontSize: 20,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 18,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 14,
          fontFamily: 'AirbnbCereal',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFFFFFF),
    primaryContainer: Color(0XFF3843FF),

    // Error colors
    errorContainer: Color(0XFF4AC443),
    onError: Color(0XFFF6F8FF),
    onErrorContainer: Color(0XFF000DFF),

    // On colors(text colors)
    onPrimary: Color(0X0F222C5C),
    onPrimaryContainer: Color(0XFF040415),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber100 => const Color(0XFFFFE6B6);
  Color get amberA400 => const Color(0XFFFFCA00);
  Color get amberA700 => const Color(0XFFFEA800);

  // Black
  Color get black900 => const Color(0XFF0F0F0F);
  Color get black90001 => const Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => const Color(0XFFCDCDD0);
  Color get blueGray50 => const Color(0XFFEAECF0);

  // Gray
  Color get gray100 => const Color(0XFFF3F4F6);
  Color get gray200 => const Color(0XFFF0F0F0);
  Color get gray500 => const Color(0XFF9B9BA1);
  Color get gray600 => const Color(0XFF686873);
  Color get gray800 => const Color(0XFF363644);

  // Green
  Color get green50 => const Color(0XFFE1F5E0);
  Color get green600 => const Color(0XFF3BA935);

  // Indigo
  Color get indigo100 => const Color(0XFFAFB4FF);
  Color get indigo50 => const Color(0XFFD7D9FF);
  Color get indigoA100 => const Color(0XFF888EFF);
  Color get indigoA200 => const Color(0XFF6B73FF);

  // LightBlue
  Color get lightBlue50 => const Color(0XFFDDF2FC);
  Color get lightBlueA700 => const Color(0XFF007AFF);

  // Orange
  Color get orange300 => const Color(0XFFFFC148);
  Color get orange50 => const Color(0XFFFFF3DA);

  // Red
  Color get red400 => const Color(0XFFE3524F);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
