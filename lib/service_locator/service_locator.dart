import 'package:ecom_clean_architecture/core/api/api_consumer.dart';
import 'package:ecom_clean_architecture/core/api/base_client.dart';
import 'package:ecom_clean_architecture/data/data_source/data_source.dart';
import 'package:ecom_clean_architecture/data/data_source/remote_market_datasource.dart';
import 'package:ecom_clean_architecture/data/repository_impl/products_repository_impl.dart';
import 'package:ecom_clean_architecture/domain/repository/products_repository.dart';
import 'package:ecom_clean_architecture/domain/usecases/get_products_usecase.dart';
import 'package:ecom_clean_architecture/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final sl = GetIt.instance;

initServiceLocator() async {
  // bloc
  sl.registerFactory<ProductsBloc>(
      () => ProductsBloc(getProductsUseCase: sl()));

  // use cases
  sl.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(productsRepository: sl()));

  // repository
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(remoteDataSource: sl()));

  // data source
  sl.registerLazySingleton<RemoteStreetMarketDataSource>(
      () => RemoteStreetMarketDataSourceImpl(apiConsumer: sl()));

  // core
  sl.registerLazySingleton<ApiConsumer>(() => ApiBaseClient(baseClient: sl()));

  // http
  sl.registerLazySingleton(() => Client());
}
