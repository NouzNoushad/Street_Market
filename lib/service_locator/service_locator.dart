import 'package:ecom_clean_architecture/features/carts/data/repository_impl/carts_repository_impl.dart';
import 'package:ecom_clean_architecture/features/carts/domain/repository/carts_repository.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/add_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/close_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/delete_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/get_carts_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/bloc/carts_bloc/carts_bloc.dart';
import 'package:ecom_clean_architecture/features/categories/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/features/categories/data/data_source/remote_categories_datasource.dart';
import 'package:ecom_clean_architecture/features/categories/data/repository_impl/categories_repository_impl.dart';
import 'package:ecom_clean_architecture/features/categories/domain/repository/categories_repository.dart';
import 'package:ecom_clean_architecture/features/categories/domain/usecase/get_categories_usecase.dart';
import 'package:ecom_clean_architecture/features/categories/presentation/bloc/categories/categories_bloc.dart';
import 'package:ecom_clean_architecture/features/product_details/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/features/product_details/data/data_source/remote_details_datasource.dart';
import 'package:ecom_clean_architecture/features/product_details/data/repository_impl/details_repository_impl.dart';
import 'package:ecom_clean_architecture/features/product_details/domain/repository/product_details_repository.dart';
import 'package:ecom_clean_architecture/features/product_details/domain/usecases/get_details_usecase.dart';
import 'package:ecom_clean_architecture/features/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../core/data_source/api/api_consumer.dart';
import '../core/data_source/api/base_client.dart';
import '../core/data_source/database/database.dart';
import '../core/data_source/database/db_consumer.dart';
import '../features/bottom_nav/cubit/bottom_nav/bottom_nav_cubit.dart';
import '../features/carts/data/data_source/data_source.dart';
import '../features/carts/data/data_source/local_market_datasource.dart';
import '../features/category.dart/data/data_source/data_source.dart';
import '../features/category.dart/data/data_source/remote_category_datasource.dart';
import '../features/category.dart/data/repository_impl/category_repository_impl.dart';
import '../features/category.dart/domain/repository/category_repository.dart';
import '../features/category.dart/domain/usecases/get_category_usecase.dart';
import '../features/category.dart/presentation/bloc/category/category_bloc.dart';
import '../features/products/data/data_source/data_source.dart';
import '../features/products/data/data_source/remote_market_datasource.dart';
import '../features/products/data/repository_impl/products_repository_impl.dart';
import '../features/products/domain/repository/products_repository.dart';
import '../features/products/domain/usecases/get_products_usecase.dart';
import '../features/products/presentation/bloc/products_bloc/products_bloc.dart';

final sl = GetIt.instance;

initServiceLocator() async {
  // bloc
  sl.registerFactory<ProductsBloc>(
      () => ProductsBloc(getProductsUseCase: sl()));
  sl.registerFactory<BottomNavCubit>(() => BottomNavCubit());

  sl.registerFactory<ProductDetailsBloc>(
      () => ProductDetailsBloc(detailsUseCase: sl()));

  sl.registerFactory<CategoriesBloc>(
      () => CategoriesBloc(categoriesUseCase: sl()));
  sl.registerFactory<CategoryBloc>(
      () => CategoryBloc(categoryUseCase: sl()));

  sl.registerFactory<CartsBloc>(() => CartsBloc(
      getCartsUseCase: sl(),
      addToCartUseCase: sl(),
      deleteCartUseCase: sl(),
      closeCartUseCase: sl()));

  // use cases
  sl.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(productsRepository: sl()));
  
  sl.registerLazySingleton<GetProductDetailsUseCase>(
      () => GetProductDetailsUseCase(productDetailsRepository: sl()));
  
  sl.registerLazySingleton<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(categoriesRepository: sl()));
   sl.registerLazySingleton<GetCategoryUseCase>(
      () => GetCategoryUseCase(categoryRepository: sl()));

  sl.registerLazySingleton<GetCartsUseCase>(
      () => GetCartsUseCase(cartsRepository: sl()));
  sl.registerLazySingleton<AddToCartUseCase>(
      () => AddToCartUseCase(cartsRepository: sl()));
  sl.registerLazySingleton<DeleteCartUseCase>(
      () => DeleteCartUseCase(cartsRepository: sl()));
  sl.registerLazySingleton<CloseCartUseCase>(
      () => CloseCartUseCase(cartsRepository: sl()));

  // repository
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImpl(detailsDataSource: sl()));
  
  sl.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(categoriesDataSource: sl()));
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(categoryDataSource: sl()));

  sl.registerLazySingleton<CartsRepository>(
      () => CartsRepositoryImpl(localDataSource: sl()));

  // data source
  sl.registerLazySingleton<RemoteStreetMarketDataSource>(
      () => RemoteStreetMarketDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<RemoteProductDetailsDataSource>(
      () => RemoteProductDetailsDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<RemoteCategoriesDataSource>(
      () => RemoteCategoriesDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RemoteCategoryDataSource>(
      () => RemoteCategoryDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<LocalStreetMarketDataSource>(
      () => LocalStreetMarketDataSourceImpl(databaseConsumer: sl()));

  // core
  sl.registerLazySingleton<ApiConsumer>(() => ApiBaseClient(baseClient: sl()));

  sl.registerLazySingleton<DatabaseConsumer>(() => StreetMarketDatabase());

  // http
  sl.registerLazySingleton(() => Client());
}
