part of 'bottom_nav_cubit.dart';

sealed class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavChangedState extends BottomNavState {
  final int index;
  const BottomNavChangedState(this.index);

  @override
  List<Object> get props => [index];
}

