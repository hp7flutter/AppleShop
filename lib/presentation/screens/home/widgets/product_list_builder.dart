import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    super.key,
    required this.title,
    required this.length,
    required this.itemBuilder,
  });
  final String title;
  final int length;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .end,
      spacing: 20,
      children: [
        Padding(
          padding: const .only(left: 12, right: 28),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colours.darkBlue,
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(Iconsax.arrow_left_3, size: 20),
                    Text('مشاهده همه'),
                  ],
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'SM',
                  fontSize: 16,
                  color: Colours.darkGrey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: length,
            scrollDirection: .horizontal,
            padding: const .symmetric(horizontal: 20),
            reverse: true,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
