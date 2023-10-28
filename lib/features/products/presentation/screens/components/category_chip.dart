import 'package:ecom_clean_architecture/config/routes/route_constant.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

class CategoryChip extends StatelessWidget {
  final String? category;
  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(RouteConstant.category, arguments: category),
      child: Chip(
          side: const BorderSide(width: 1.2, color: ColorPicker.primaryColor4),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          backgroundColor: ColorPicker.primaryColor2,
          label: Text(
            category ?? "",
            style: const TextStyle(fontSize: 15, letterSpacing: 1),
          )),
    );
  }
}
