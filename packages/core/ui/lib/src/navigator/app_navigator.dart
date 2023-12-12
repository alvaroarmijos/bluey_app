// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();

  static const ROUTE_MAIN_PAGE = Navigator.defaultRouteName;
  static const ROUTE_HOME = "/home";
  static const ROUTE_CHARACTER = "/character";

  static const ARGS_CHARACTER_ID = 'characterId';

  static void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, ROUTE_HOME);
  }

  static void navigateToCharacterDetail(
    BuildContext context,
    int characterId,
  ) {
    Navigator.pushNamed(
      context,
      ROUTE_CHARACTER,
      arguments: <String, dynamic>{
        ARGS_CHARACTER_ID: characterId,
      },
    );
  }
}
