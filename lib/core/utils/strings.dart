import 'package:flutter/material.dart';

class AppStrings {
  static const String pageNotFound = 'Page Not Found';
  static const String serverFailure = "Server Failure";
  static const String unexpectedError = "Unexpected Error";

  static const String appTitle = 'Street Market';
  static const String databaseName = 'cartsDB.db';
  static const String tableName = 'carts';
}

void logger(String msg, dynamic debug) {
  debugPrint('/////////=================>>>>>>> $msg: $debug');
}
