import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:ecom_clean_architecture/config/routes/routes.dart';
import 'package:ecom_clean_architecture/config/theme/theme.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/add_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/close_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/delete_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/get_carts_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/bloc/carts_bloc/carts_bloc.dart';
import 'package:ecom_clean_architecture/features/categories/domain/usecase/get_categories_usecase.dart';
import 'package:ecom_clean_architecture/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/usecases/get_category_usecase.dart';
import 'package:ecom_clean_architecture/features/category.dart/presentation/bloc/category/category_bloc.dart';
import 'package:ecom_clean_architecture/features/product_details/domain/usecases/get_details_usecase.dart';
import 'package:ecom_clean_architecture/features/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:ecom_clean_architecture/features/products/domain/usecases/get_products_usecase.dart';
import 'package:ecom_clean_architecture/service_locator/service_locator.dart'
    as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bottom_nav/cubit/bottom_nav/bottom_nav_cubit.dart';
import 'features/products/presentation/bloc/products_bloc/products_bloc.dart';

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
        BlocProvider(
          create: (context) => CartsBloc(
            getCartsUseCase: di.sl<GetCartsUseCase>(),
            addToCartUseCase: di.sl<AddToCartUseCase>(),
            deleteCartUseCase: di.sl<DeleteCartUseCase>(),
            closeCartUseCase: di.sl<CloseCartUseCase>()
          ),
        ),
         BlocProvider(
          create: (context) => ProductDetailsBloc(
            detailsUseCase: di.sl<GetProductDetailsUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(
            categoriesUseCase: di.sl<GetCategoriesUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            categoryUseCase: di.sl<GetCategoryUseCase>(),
          ),
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
