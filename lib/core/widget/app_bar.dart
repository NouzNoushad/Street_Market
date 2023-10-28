import 'package:flutter/material.dart';

import '../utils/colors.dart';

class StreetMarketAppBar {
  static AppBar appBar({
    bool automaticallyImplyLeading = false,
    required String title,
    List<Widget>? actions,
  }) =>
      AppBar(
        backgroundColor: ColorPicker.primaryColor4,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(title),
        actions: actions,
      );
}
