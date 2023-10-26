import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:ecom_clean_architecture/config/routes/routes.dart';
import 'package:ecom_clean_architecture/config/theme/theme.dart';
import 'package:ecom_clean_architecture/domain/usecases/get_products_usecase.dart';
import 'package:ecom_clean_architecture/presentation/bloc/bottom_nav/bottom_nav_cubit.dart';
import 'package:ecom_clean_architecture/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:ecom_clean_architecture/service_locator/service_locator.dart'
    as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductsBloc(getProductsUseCase: di.sl<GetProductsUseCase>()),
        ),
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: RouteConstant.bottomNav,
      ),
    );
  }
}
