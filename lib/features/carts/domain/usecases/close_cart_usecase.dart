import '../repository/carts_repository.dart';

class CloseCartUseCase{
  final CartsRepository _cartsRepository;
  CloseCartUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;

  Future<void> call() => _cartsRepository.close();
}
