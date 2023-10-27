import 'package:ecom_clean_architecture/core/usecase/usecase.dart';

import '../repository/carts_repository.dart';

class DeleteCartUseCase extends UseCase<bool, int> {
  final CartsRepository _cartsRepository;
  DeleteCartUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;

  @override
  Future<bool> call([int? param]) => _cartsRepository.deleteFromCart(param!);
}
