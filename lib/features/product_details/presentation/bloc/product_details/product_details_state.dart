part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsLoadedState extends ProductDetailsState {
  final ProductDetailsEntity detailsEntity;
  const ProductDetailsLoadedState(this.detailsEntity);

  @override
  List<Object> get props => [detailsEntity];
}

class ProductDetailsErrorState extends ProductDetailsState {
  final String error;
  const ProductDetailsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
