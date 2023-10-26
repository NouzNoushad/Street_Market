import 'package:ecom_clean_architecture/service_locator/service_locator.dart'
    as di;
import 'package:flutter/material.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initServiceLocator();
  runApp(const MyApp());
}
