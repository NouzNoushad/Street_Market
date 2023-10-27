import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/features/products/domain/usecases/get_products_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/products_entity.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase _getProductsUseCase;
  ProductsBloc({required GetProductsUseCase getProductsUseCase})
      : _getProductsUseCase = getProductsUseCase,
        super(ProductsInitial()) {
    on<ProductsLoadedEvent>(getProducts());
  }

  EventHandler<ProductsLoadedEvent, ProductsState> getProducts() =>
      ((event, emit) async {
        emit(ProductsLoadingState());
        try {
          Either<Failed, List<ProductsEntity>> productsData =
              await _getProductsUseCase.call();
          emit(productsData.fold(
              (failure) => ProductsErrorState(failureToMsg(failure)),
              (products) => ProductsLoadedState(products)));
        } catch (error) {
          emit(ProductsErrorState(error.toString()));
        }
      });
}
