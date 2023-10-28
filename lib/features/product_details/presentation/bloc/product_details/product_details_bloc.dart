import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/features/product_details/domain/usecases/get_details_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/product_details_entity.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase _detailsUseCase;
  ProductDetailsBloc({required GetProductDetailsUseCase detailsUseCase})
      : _detailsUseCase = detailsUseCase,
        super(ProductDetailsInitial()) {
    on<ProductDetailsLoadedEvent>(getProductDetails());
  }

  EventHandler<ProductDetailsLoadedEvent, ProductDetailsState>
      getProductDetails() => ((event, emit) async {
            emit(ProductDetailsLoadingState());
            try {
              Either<Failed, ProductDetailsEntity> detailsEntity =
                  await _detailsUseCase.call(event.productId);
              emit(detailsEntity.fold(
                  (failure) => ProductDetailsErrorState(failureToMsg(failure)),
                  (details) => ProductDetailsLoadedState(details)));
            } catch (error) {
              emit(ProductDetailsErrorState(error.toString()));
            }
          });
}
