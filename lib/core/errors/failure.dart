import 'package:equatable/equatable.dart';

import '../utils/strings.dart';

abstract class Failed extends Equatable{
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failed {}

String failureToMsg(Failed failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.serverFailure;
    default:
      return AppStrings.unexpectedError;
  }
}
