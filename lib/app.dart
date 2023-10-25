import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:ecom_clean_architecture/config/routes/routes.dart';
import 'package:ecom_clean_architecture/config/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: RouteConstant.home,
    );
  }
}
