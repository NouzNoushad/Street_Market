import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavChangedState(0));

  int currentIndex = 0;
  onTapChangePage(value) {
    currentIndex = value;
    emit(BottomNavChangedState(currentIndex));
  }
}
