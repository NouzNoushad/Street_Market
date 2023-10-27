import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/features/products/presentation/screens/bottom_nav/bottom_nav.dart';
import 'package:ecom_clean_architecture/features/products/presentation/screens/street_market_home/street_market_home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.bottomNav:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.bottomNav),
            builder: (context) => const StreetMarketBottomNav());
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
