import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/features/products/domain/entity/products_entity.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final ProductsEntity product;
  const ProductsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorPicker.backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.5, color: ColorPicker.primaryColor3)),
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Expanded(
            flex: 1,
            child: product.image != ""
                ? Image.network(product.image.toString())
                : Container()),
        const SizedBox(
          height: 10,
        ),
        Text(
          product.title.toString(),
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Material(
                color: ColorPicker.primaryColor2,
                borderRadius: BorderRadius.circular(5),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 22,
                    color: ColorPicker.primaryColor4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
