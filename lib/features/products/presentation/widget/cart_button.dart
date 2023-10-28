import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:ecom_clean_architecture/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CartButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.96,
      height: context.height * 0.065,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorPicker.primaryColor2,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 1.5, color: ColorPicker.primaryColor4),
              borderRadius: BorderRadius.circular(6),
            )),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 17,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              color: ColorPicker.primaryColor4),
        ),
      ),
    );
  }
}
