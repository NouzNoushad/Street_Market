import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/screens/components/cart_bottom_content.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/screens/components/cart_top_content.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class CartItem extends StatelessWidget {
  final CartsEntity cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      decoration: BoxDecoration(
        color: ColorPicker.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Container(
          width: context.width * 0.3,
          color: ColorPicker.whiteColor,
          child: cart.image != null ? Image.network(cart.image!) : Container(),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartItemTopContent(
                cart: cart,
              ),
              CartItemBottomContent(
                cart: cart,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
