import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecom_clean_architecture/core/errors/failure.dart';
import 'package:ecom_clean_architecture/features/categories/domain/usecase/get_categories_usecase.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase _categoriesUseCase;
  CategoriesBloc({required GetCategoriesUseCase categoriesUseCase})
      : _categoriesUseCase = categoriesUseCase,
        super(CategoriesInitial()) {
    on<CategoriesLoadedEvent>(getCategories());
  }

  EventHandler<CategoriesLoadedEvent, CategoriesState> getCategories() =>
      ((event, emit) async {
        emit(CategoriesLoadingState());
        try {
          Either<Failed, List<String>> categories =
              await _categoriesUseCase.call();
          emit(categories.fold(
              (failure) => CategoriesErrorState(failureToMsg(failure)),
              (category) => CategoriesLoadedState(category)));
        } catch (error) {
          emit(CategoriesErrorState(error.toString()));
        }
      });
}
