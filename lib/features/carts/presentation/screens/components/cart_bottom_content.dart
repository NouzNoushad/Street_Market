import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class CartItemBottomContent extends StatelessWidget {
  final CartsEntity cart;
  const CartItemBottomContent({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '\$${cart.price}',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.width * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: context.height * 0.04,
                        width: context.width * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorPicker.primaryColor1),
                        child: const Icon(
                          Icons.add,
                          color: ColorPicker.primaryColor4,
                        ),
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Container(
                        height: context.height * 0.04,
                        width: context.width * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorPicker.primaryColor1),
                        child: const Icon(
                          Icons.remove,
                          color: ColorPicker.primaryColor4,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ],
    );
  }
}
