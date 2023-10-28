import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/carts/domain/repository/carts_repository.dart';

class AddToCartUseCase {
  final CartsRepository _cartsRepository;
  AddToCartUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;

  Future<bool> call({required CartsEntity carts}) =>
      _cartsRepository.addToCart(carts);
}
