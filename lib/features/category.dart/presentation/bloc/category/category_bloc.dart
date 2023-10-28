import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/entity/category_entity.dart';
import 'package:ecom_clean_architecture/features/category.dart/domain/usecases/get_category_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoryUseCase _categoryUseCase;
  CategoryBloc({required GetCategoryUseCase categoryUseCase})
      : _categoryUseCase = categoryUseCase, super(CategoryInitial()) {
    on<CategoryLoadedEvent>(getCategory());
  }

  EventHandler<CategoryLoadedEvent, CategoryState> getCategory() =>
      ((event, emit) async {
        emit(CategoryLoadingState());
        try {
          Either<Failed, List<CategoryEntity>> categories =
              await _categoryUseCase.call(event.category);
          emit(categories.fold(
              (failure) => CategoryErrorState(failureToMsg(failure)),
              (category) => CategoryLoadedState(category)));
        } catch (error) {
          emit(CategoryErrorState(error.toString()));
        }
      });
}
