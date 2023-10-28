part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class CategoriesLoadedEvent extends CategoriesEvent {
  const CategoriesLoadedEvent();

  @override
  List<Object> get props => [];
}
