import 'package:ecom_clean_architecture/core/usecase/usecase.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/carts/domain/repository/carts_repository.dart';

class AddToCartUseCase extends UseCase<bool, CartsEntity> {
  final CartsRepository _cartsRepository;
  AddToCartUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;

  @override
  Future<bool> call([CartsEntity? param]) =>
      _cartsRepository.addToCart(param!);
}
