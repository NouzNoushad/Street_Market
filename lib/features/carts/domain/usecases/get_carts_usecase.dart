import 'package:ecom_clean_architecture/features/carts/domain/repository/carts_repository.dart';

import '../entity/carts_entity.dart';

class GetCartsUseCase {
  final CartsRepository _cartsRepository;
  GetCartsUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;
  
  Future<List<CartsEntity>> call() => _cartsRepository.getCarts();
}
