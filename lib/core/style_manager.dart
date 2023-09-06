import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: FontsConstans.fonntFamily,
    fontSize: fontSize,
    color: color,
  );
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    FontWeight = FontWightManager.regular}) {
  return _getTextStyle(fontSize, color, FontWeight);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    FontWeight = FontWightManager.medium}) {
  return _getTextStyle(fontSize, color, FontWeight);
}

TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    FontWeight = FontWightManager.extraBold}) {
  return _getTextStyle(fontSize, color, FontWeight);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s14,
    required Color color,
    FontWeight = FontWightManager.bold}) {
  return _getTextStyle(fontSize, color, FontWeight);
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    FontWeight = FontWightManager.light}) {
  return _getTextStyle(fontSize, color, FontWeight);
}
