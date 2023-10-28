import '../model/product_details_model.dart';

abstract class RemoteProductDetailsDataSource {
  Future<ProductDetailsModel> getProductDetails(int productId);
}
