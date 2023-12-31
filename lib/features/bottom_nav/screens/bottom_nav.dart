import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/screens/cart_screen.dart';
import 'package:ecom_clean_architecture/features/categories/presentation/screens/categories.dart';
import 'package:ecom_clean_architecture/features/products/presentation/screens/street_market_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bottom_nav/bottom_nav_cubit.dart';

class StreetMarketBottomNav extends StatefulWidget {
  const StreetMarketBottomNav({super.key});

  @override
  State<StreetMarketBottomNav> createState() => _StreetMarketBottomNavState();
}

class _StreetMarketBottomNavState extends State<StreetMarketBottomNav> {
  late BottomNavCubit bottomNavCubit;

  currentPage(int index) {
    switch (index) {
      case 0:
        return const StreetMarketHomeScreen();
      case 1:
        return const StreetMarketCategoriesScreen();
      case 2:
        return const StreetMarketCartScreen();
    }
  }

  @override
  void initState() {
    bottomNavCubit = BlocProvider.of<BottomNavCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        if (state is BottomNavChangedState) {
          return Scaffold(
            backgroundColor: ColorPicker.primaryColor1,
            bottomNavigationBar: Material(
              color: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  side: BorderSide(width: 2, color: ColorPicker.primaryColor3)),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: BottomNavigationBar(
                    currentIndex: bottomNavCubit.currentIndex,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: ColorPicker.backgroundColor,
                    selectedItemColor: ColorPicker.primaryColor4,
                    unselectedItemColor: ColorPicker.primaryColor3,
                    showUnselectedLabels: false,
                    showSelectedLabels: false,
                    onTap: bottomNavCubit.onTapChangePage,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.category), label: 'Category'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart), label: 'Cart'),
                    ]),
              ),
            ),
            body: currentPage(bottomNavCubit.currentIndex),
          );
        }
        return const Scaffold(
          backgroundColor: ColorPicker.primaryColor1,
        );
      },
    );
  }
}
