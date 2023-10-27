import 'package:ecom_clean_architecture/features/carts/data/repository_impl/carts_repository_impl.dart';
import 'package:ecom_clean_architecture/features/carts/domain/repository/carts_repository.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/add_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/close_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/delete_cart_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/usecases/get_carts_usecase.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/bloc/carts_bloc/carts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../core/data_source/api/api_consumer.dart';
import '../core/data_source/api/base_client.dart';
import '../core/data_source/database/database.dart';
import '../core/data_source/database/db_consumer.dart';
import '../features/carts/data/data_source/data_source.dart';
import '../features/carts/data/data_source/local_market_datasource.dart';
import '../features/products/data/data_source/data_source.dart';
import '../features/products/data/data_source/remote_market_datasource.dart';
import '../features/products/data/repository_impl/products_repository_impl.dart';
import '../features/products/domain/repository/products_repository.dart';
import '../features/products/domain/usecases/get_products_usecase.dart';
import '../features/products/presentation/bloc/bottom_nav/bottom_nav_cubit.dart';
import '../features/products/presentation/bloc/products_bloc/products_bloc.dart';

final sl = GetIt.instance;

initServiceLocator() async {
  // bloc
  sl.registerFactory<ProductsBloc>(
      () => ProductsBloc(getProductsUseCase: sl()));
  sl.registerFactory<BottomNavCubit>(() => BottomNavCubit());

  sl.registerFactory<CartsBloc>(() => CartsBloc(
      getCartsUseCase: sl(),
      addToCartUseCase: sl(),
      deleteCartUseCase: sl(),
      closeCartUseCase: sl()));

  // use cases
  sl.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(productsRepository: sl()));

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

  sl.registerLazySingleton<CartsRepository>(
      () => CartsRepositoryImpl(localDataSource: sl()));

  // data source
  sl.registerLazySingleton<RemoteStreetMarketDataSource>(
      () => RemoteStreetMarketDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<LocalStreetMarketDataSource>(
      () => LocalStreetMarketDataSourceImpl(streetMarketDatabase: sl()));

  // core
  sl.registerLazySingleton<ApiConsumer>(() => ApiBaseClient(baseClient: sl()));

  sl.registerLazySingleton<DatabaseConsumer>(() => StreetMarketDatabase());

  // http
  sl.registerLazySingleton(() => Client());
}
