import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:flutter/material.dart';

class StreetMarketHomeScreen extends StatelessWidget {
  const StreetMarketHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Street Market'),
      ),
    );
  }
}
