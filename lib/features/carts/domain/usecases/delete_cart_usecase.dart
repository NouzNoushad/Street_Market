import '../repository/carts_repository.dart';

class DeleteCartUseCase {
  final CartsRepository _cartsRepository;
  DeleteCartUseCase({required CartsRepository cartsRepository})
      : _cartsRepository = cartsRepository;

  Future<bool> call({required int id}) => _cartsRepository.deleteFromCart(id);
}
