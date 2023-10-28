part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryLoadedEvent extends CategoryEvent {
  final String category;
  const CategoryLoadedEvent(this.category);

  @override
  List<Object> get props => [category];
}
