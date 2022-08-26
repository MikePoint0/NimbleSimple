import 'package:flutter/material.dart';

import 'helpers.dart';

class AppColors {

  static Color sonaPurple1 = getColorHexFromStr("811AFF");
  static Color sonaPurple2 = getColorHexFromStr("A257FF");
  static Color sonaPurpleDisabled = getColorHexFromStr("443B4F");
  static Color sonaDisabledGrey = getColorHexFromStr("5E5E5E");
  static Color sonaLightBlack = getColorHexFromStr("242424");
  static Color sonaLighterBlack = getColorHexFromStr("2c2c2c");
  static Color sonaGrey = getColorHexFromStr("AAAAAA");
  static const Color goku = Color(0xFFF5F5F5);
  static const Color titleActive = Colors.white;

  static const Color body = Color(0xFF394455);
  static const Color label = Color(0xFF394455);
  static Color primaryActive = sonaPurple1;
  static Color primaryDisabled = sonaPurpleDisabled;
  static const Color darkMode = Color(0xFF252836);
  static Color sonaBlack = getColorHexFromStr("131313");

  static const Color placeHolder = Color(0xFFA0A3BD);
  static const Color inputBackground = Color(0xFFEFF0F6);
  static const Color background = Color(0xFFF7F7FC);
  static const Color cardStroke = Color(0xFFDBDFE4);
  static const Color innerBorder = Color(0xFFDCD6CF);
  static const Color textNeutral = Color(0xFF848F9F);
  static const Color claretColor = Color(0xFFA41857);

  static const Color secondaryTextColor = Color(0xFF4C6174);
  static const Color errorDefault = Color(0xFFED405C);
///////////////////////////

  static Color sonaBlack1 = getColorHexFromStr("000000");
  static Color sonaBlack2 = getColorHexFromStr("131313");
  static Color sonaBlack3 = getColorHexFromStr("1D1D1D");
  static Color sonaBlack4 = getColorHexFromStr("27282C");

  static Color sonaWhite = getColorHexFromStr("FFFFFF");

  static Color sonaGrey1 = getColorHexFromStr("333333");
  static Color sonaGrey2 = getColorHexFromStr("4F4F4F");
  static Color sonaGrey3 = getColorHexFromStr("828282");
  static Color sonaGrey4 = getColorHexFromStr("BDBDBD");
  static Color sonaGrey5 = getColorHexFromStr("E0E0E0");
  static Color sonaGrey6 = getColorHexFromStr("F1F1F1");

  static Color sonaGreen = getColorHexFromStr("00893E");
  static Color sonaRed = getColorHexFromStr("EC000C");
  static Color sonaYellow = getColorHexFromStr("EEFF70");

  static Color sonaG1 = getColorHexFromStr("9741FF");
  static Color sonaG2 = getColorHexFromStr("645EFD");
  static Color sonaG3 = getColorHexFromStr("007DB3");

  static Color lightPrimary = Color(0xfffcfcff);
  static Color lightAccent = Color(0xFF3B72FF);
  static Color lightBackground = Color(0xfffcfcff);

  static Color darkPrimary = Colors.black;
  static Color darkAccent = Color(0xFF3B72FF);
  static Color darkBackground = Colors.black;

  static Color grey = Color(0xff707070);
  static Color textPrimary = Color(0xFF486581);
  static Color textDark = Color(0xFF102A43);

  static Color backgroundColor = Color(0xFFF5F5F7);

  // Green
  static Color darkGreen = Color(0xFF3ABD6F);
  static Color lightGreen = Color(0xFFA1ECBF);

  // Yellow
  static Color darkYellow = Color(0xFF3ABD6F);
  static Color lightYellow = Color(0xFFFFDA7A);

  // Blue
  static Color darkBlue = Color(0xFF3B72FF);
  static Color lightBlue = Color(0xFF3EC6FF);

  // Orange
  static Color darkOrange = Color(0xFFFFB74D);

  static LinearGradient sonaPrimaryButtonGradient = LinearGradient(
      colors: [sonaG1, sonaG2, sonaG3]
  );

  static LinearGradient sonaPrimaryButtonDisabledColorGradient = LinearGradient(
      colors: [sonaG1, sonaG2, sonaG3]
  );
  static LinearGradient sonaSecondaryButtonGradient = LinearGradient(
      colors: [getColorHexFromStr("ffffff"), getColorHexFromStr("ffffff"), getColorHexFromStr("ffffff")]
  );
  static LinearGradient sonaTertiaryButtonGradient = LinearGradient(
      colors: [getColorHexFromStr("ffffff"), getColorHexFromStr("ffffff"), getColorHexFromStr("ffffff")]
  );
  static LinearGradient sonaSwitchGradient = LinearGradient(
      colors: [sonaGrey6, sonaGrey3, sonaGrey6]
  );


}
