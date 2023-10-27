import 'package:ecom_clean_architecture/core/usecase/usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/repository/carts_repository.dart';

import '../entity/carts_entity.dart';

class GetCartsUseCase extends UseCase<List<CartsEntity>, void> {
  final CartsRepository _cartsRepository;
  GetCartsUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;
  @override
  Future<List<CartsEntity>> call([void param]) => _cartsRepository.getCarts();
}
