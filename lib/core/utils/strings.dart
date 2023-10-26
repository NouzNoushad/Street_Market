import 'package:flutter/material.dart';

class AppStrings {
  static const String pageNotFound = 'Page Not Found';
  static const String serverFailure = "Server Failure";
  static const String unexpectedError = "Unexpected Error";

  static const String appTitle = 'Street Market';
}

void logger(String msg, dynamic debug) {
  debugPrint('/////////=================>>>>>>> $msg: $debug');
}
