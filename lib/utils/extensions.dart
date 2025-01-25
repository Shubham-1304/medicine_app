import 'package:flutter/material.dart';
import 'package:medicine_app/utils/app_theme/app_config.dart';
import 'package:medicine_app/utils/app_theme/app_theme.dart';

extension BuildContextExtension on BuildContext {
  AppTheme get appTheme => AppConfig.of(this).appTheme;


  Future push(Widget widget, {String? routeName}) => Navigator.of(this).push(
        MaterialPageRoute(
            builder: (_) => widget, settings: RouteSettings(name: routeName)),
      );

  Future pushReplacement(Widget widget, {String? routeName}) =>
      Navigator.of(this).pushReplacement(
        MaterialPageRoute(
            builder: (_) => widget, settings: RouteSettings(name: routeName)),
      );

  void popToHome() =>
      Navigator.popUntil(this, ModalRoute.withName(Navigator.defaultRouteName));

  void pop([dynamic result]) => Navigator.of(this).pop(result);
}
