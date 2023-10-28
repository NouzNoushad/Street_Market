part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final List<String> categories;
  const CategoriesLoadedState(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoriesErrorState extends CategoriesState {
  final String error;
  const CategoriesErrorState(this.error);

  @override
  List<Object> get props => [error];
}
