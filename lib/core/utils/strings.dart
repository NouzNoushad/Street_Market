import 'package:flutter/material.dart';

class AppStrings {
  static const String pageNotFound = 'Page Not Found';
  static const String serverFailure = "Server Failure";
  static const String unexpectedError = "Unexpected Error";

  static const String databaseName = 'cartsDB.db';
  static const String tableName = 'cart';

  static const String appTitle = 'Street Market';
  static const String cartTitle = 'Street Cart';
  static const String detailsTitle = 'Details';
}

void logger(String msg, dynamic debug) {
  debugPrint('/////////=================>>>>>>> $msg: $debug');
}
