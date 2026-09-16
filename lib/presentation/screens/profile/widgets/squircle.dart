import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

List squircleItemsIcons = [
  Iconsax.setting5,
  Iconsax.card_pos5,
  Iconsax.location5,
  Iconsax.heart5,
  Iconsax.receipt_2_15,
  Iconsax.receipt_disscount5,
  // Iconsax.car5,
  Iconsax.task_square5,
  Iconsax.notification_bing5,
  Iconsax.note_215,
  Iconsax.call_calling5,
  Iconsax.profile_2user5,
  Iconsax.info_circle5,
];
// .reversed.toList();

List squircleItemTitles = [
  'تنظیمات',
  'سفارشات اخیر',
  'آدرس‌ها',
  'علاقه‌مندی‌ها',
  'نقد و نظرات',
  'تخفیف‌ها',
  'سفارشات جاری',
  'اطلاعیه',
  'بلاگ',
  'پشتیبانی',
  'مک‌کلاب',
  'درباره ما',
];

Widget squircle({
  IconData? icon,
  String? title,
  double paddingRight = 0.0,
}) {
  return Column(
    children: [
      Container(
        width: 56,
        height: 56,
        decoration: const ShapeDecoration(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          color: Colours.darkBlue,
          shadows: [
            BoxShadow(
              color: Colours.darkBlue,
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(right: paddingRight),
          child: Icon(
            icon!,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        title!,
        style: const TextStyle(
          fontFamily: 'SB',
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    ],
  );
}
