import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/strings.dart';
import 'package:ecom_clean_architecture/features/bottom_nav/screens/bottom_nav.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/screens/cart_screen.dart';
import 'package:ecom_clean_architecture/features/categories/presentation/screens/categories.dart';
import 'package:ecom_clean_architecture/features/category.dart/presentation/screens/category.dart';
import 'package:ecom_clean_architecture/features/product_details/presentation/screens/product_details.dart';
import 'package:ecom_clean_architecture/features/products/presentation/screens/street_market_home.dart';
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
      case RouteConstant.details:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.details),
            builder: (context) => ProductDetails(
                  productId: settings.arguments as int,
                ));
      case RouteConstant.categories:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.categories),
            builder: (context) => const StreetMarketCategoriesScreen());
      case RouteConstant.category:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.category),
            builder: (context) => CategoryScreen(
                  category: settings.arguments as String,
                ));
      case RouteConstant.cart:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.cart),
            builder: (context) => const StreetMarketCartScreen());
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
