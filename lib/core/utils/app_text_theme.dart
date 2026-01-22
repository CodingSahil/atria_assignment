import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextStyle textStyle({required double fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(fontFamily: "Mulish", fontSize: fontSize, fontWeight: fontWeight ?? FontWeight.w500, color: color);
  }

  static Widget textTheme(String value, {required double fontSize, FontWeight? fontWeight, Color? color, int? maxLines}) {
    return Text(
      value,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      style: textStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }

  static TextTheme createTextTheme(BuildContext context, String bodyFontString, String displayFontString) {
    TextTheme baseTextTheme = Theme.of(context).textTheme;
    TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
    TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
    TextTheme textTheme = displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );
    return textTheme;
  }
}
