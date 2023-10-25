import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/presentation/screens/street_market_home/street_market_home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.home),
            builder: (context) => const StreetMarketHomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.backgroundColor,
                  body: Center(
                      child: Text(
                    AppStrings.pageNotFound,
                  )),
                ));
    }
  }
}
