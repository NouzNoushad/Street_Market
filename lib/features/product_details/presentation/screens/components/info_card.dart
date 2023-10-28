import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constant.dart';
import '../../../domain/entity/product_details_entity.dart';

class ProductInfoCard extends StatelessWidget {
  final ProductDetailsEntity product;
  const ProductInfoCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorPicker.whiteColor,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title.toString(),
            maxLines: 2,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          sbH(8),
          Text(
            product.category.toString().toCamelCase(),
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          sbH(8),
          Text(
            '\$${product.price}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          sbH(8),
          Text(
            product.description.toString(),
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
