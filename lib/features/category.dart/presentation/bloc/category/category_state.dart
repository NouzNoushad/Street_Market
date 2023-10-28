part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();
  
  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<CategoryEntity> categories;
  const CategoryLoadedState(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryErrorState extends CategoryState {
  final String error;
  const CategoryErrorState(this.error);

  @override
  List<Object> get props => [error];
}
