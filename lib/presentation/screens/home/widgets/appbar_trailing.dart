import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Widget appbarTrailing() {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(padding: .symmetric(horizontal: 4)),
    child: Row(
      spacing: 8,
      children: [
        Text(
          'جستجوی محصولات',
          style: TextStyle(fontSize: 16, color: Colours.darkGrey),
        ),
        Icon(Iconsax.search_normal_1, color: Colours.black, size: 24),
      ],
    ),
  );
}
