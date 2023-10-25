import 'package:ecom_clean_architecture/core/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData get appTheme => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: ColorPicker.seedColor),
    );
