import 'package:ecom_clean_architecture/core/usecase/usecase.dart';

import '../repository/carts_repository.dart';

class CloseCartUseCase extends UseCase<void, void> {
  final CartsRepository _cartsRepository;
  CloseCartUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;

  @override
  Future<void> call([void param]) => _cartsRepository.close();
}
