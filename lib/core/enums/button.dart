import 'package:nimble_simple/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:nimble_simple/core/utils/styles.dart';

enum ButtonType { primary, secondary, tertiary }

extension ButtonTypeExt on ButtonType {
  LinearGradient get defaultGradient {
    switch (this) {
      case ButtonType.primary:
        return AppColors.sonaPrimaryButtonGradient;
      case ButtonType.secondary:
        return AppColors.sonaSecondaryButtonGradient;
      case ButtonType.tertiary:
        return AppColors.sonaTertiaryButtonGradient;
    }
  }
  Color get defaultColor {
    switch (this) {
      case ButtonType.primary:
        return Colors.transparent;
      case ButtonType.secondary:
        return AppColors.sonaGrey6;
      case ButtonType.tertiary:
        return Colors.transparent;
    }
  }
  LinearGradient get disabledColorGradient {
    switch (this) {
      case ButtonType.primary:
        return AppColors.sonaPrimaryButtonDisabledColorGradient;
      case ButtonType.secondary:
        return AppColors.sonaSecondaryButtonGradient;
      case ButtonType.tertiary:
        return AppColors.sonaTertiaryButtonGradient;
    }
  }
  Color get disabledColor {
    switch (this) {
      case ButtonType.primary:
        return AppColors.sonaGrey6.withOpacity(0.7);
      case ButtonType.secondary:
        return AppColors.sonaGrey6.withOpacity(0.7);
      case ButtonType.tertiary:
        return Colors.transparent;
    }
  }
  Color get borderColor {
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.tertiary:
        return Colors.transparent;
    }
  }
  Color get defaultTextColor {
    switch (this) {
      case ButtonType.primary:
        return AppColors.sonaWhite;
      case ButtonType.secondary:
        return AppColors.sonaBlack2;
      case ButtonType.tertiary:
        return AppColors.sonaBlack2;
    }
  }
  Color get disableTextColor {
    switch (this) {
      case ButtonType.primary:
        return AppColors.sonaWhite;
      case ButtonType.secondary:
        return AppColors.sonaBlack2;
      case ButtonType.tertiary:
        return AppColors.sonaBlack2;
    }
  }
  TextStyle get buttonStyle {
    switch (this) {
      case ButtonType.primary:
        return AppStyle.buttonText;
      case ButtonType.secondary:
        return AppStyle.buttonText.copyWith(color: AppColors.sonaBlack2);
      case ButtonType.tertiary:
        return AppStyle.buttonText.copyWith(color: AppColors.sonaBlack2);
    }
  }
  TextStyle get disabledTextColor {
    switch (this) {
      case ButtonType.primary:
        return AppStyle.buttonText.copyWith(color: AppColors.sonaWhite);
      case ButtonType.secondary:
        return AppStyle.buttonText.copyWith(color: AppColors.sonaBlack2.withOpacity(0.4));
      case ButtonType.tertiary:
        return AppStyle.buttonText.copyWith(color: AppColors.sonaBlack2.withOpacity(0.4));
    }
  }
}
