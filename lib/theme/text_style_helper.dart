import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14BoldPoppins => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
        color: appTheme.black_900_01,
      );

  TextStyle get body12BoldPoppins => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
        color: appTheme.white_A700,
      );

  TextStyle get body12MediumPoppins => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: appTheme.black_900_01,
      );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label10BoldPoppins => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Poppins',
      );

  TextStyle get label10RegularPoppins => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        color: appTheme.gray_900,
      );

  TextStyle get label9LightPoppins => TextStyle(
        fontSize: 9.fSize,
        fontWeight: FontWeight.w300,
        fontFamily: 'Poppins',
        color: appTheme.yellow_900,
      );

  TextStyle get label9RegularPoppins => TextStyle(
        fontSize: 9.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        color: appTheme.colorB28181,
      );

  TextStyle get label7RegularPoppins => TextStyle(
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      );
}
