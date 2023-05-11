import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
part 'color_scheme.dart';

ThemeData get lightTheme => ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: _lightColorScheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      return _lightColorScheme.onSurface;
    }), backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      return _lightColorScheme.secondary;
    }))));

ThemeData get darkTheme => ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      colorScheme: _darkColorScheme,
    );
