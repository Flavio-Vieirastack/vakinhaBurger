import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/constants/constants.dart';

class VakinhaAppBar extends AppBar {
  VakinhaAppBar({
    Key? key,
    double elevation = 2,
  }) : super(
            key: key,
            backgroundColor: Colors.white,
            elevation: 3,
            centerTitle: true,
            title: Image.asset(
              Constants.LOGO_ASSET,
              width: 80,
            ),
            iconTheme: const IconThemeData(color: Colors.black));
}
