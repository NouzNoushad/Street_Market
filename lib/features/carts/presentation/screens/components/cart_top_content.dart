import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/constant.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:ecom_clean_architecture/features/carts/domain/entity/carts_entity.dart';
import 'package:ecom_clean_architecture/features/carts/presentation/bloc/carts_bloc/carts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemTopContent extends StatelessWidget {
  final CartsEntity cart;
  const CartItemTopContent({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cart.title.toString(),
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sbH(10),
                Text(
                  cart.category.toString(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<CartsBloc>().add(DeleteCartEvent(cart.id!));
              context.toast(message: 'Cart Removed Successfully');
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(10, 6, 0, 10),
              child: Icon(
                Icons.delete,
                color: ColorPicker.primaryColor4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
