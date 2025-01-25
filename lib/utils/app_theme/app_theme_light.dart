import 'package:flutter/material.dart';
import 'package:medicine_app/utils/app_theme/app_theme.dart';

class AppThemeLight implements AppTheme {
  @override
  Color inputFieldColor = const Color(0x99FFE3DB);
  @override
  Color primaryColor = const Color(0xFFFF4E9F);
  @override
  Color secondaryColor = const Color(0xFFFF4E69);
  @override
  Color accentColor = const Color(0xffFF4E9F).withOpacity(0.2);
  @override
  Color themePrimaryColor = const Color(0xFFFFFFFF);
  @override
  Color themeSecondaryColor = const Color(0xFFFF4E69);
  @override
  Color textBrightBgColor = const Color(0xFF000000);
  @override
  Color textDarkBgColor = const Color(0xFFFFFFFF);
  @override
  Color secondaryBgColor = const Color(0xFFE4E5E7);
  @override
  Color iconBrightBgColor = const Color(0xFF000000);
  @override
  Color iconDarkBgColor = const Color(0xFFFFFFFF);
  @override
  Color linkTextColor = const Color(0xFF2196F3); //const Color(0xFF0645AD);
  @override
  Color lightBgColor = const Color(0xFFFFFFFF);
  @override
  Color darkBgColor = const Color(0xFF000000);
}
