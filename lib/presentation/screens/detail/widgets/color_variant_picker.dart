import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_model.dart';
import 'package:flutter/material.dart';

class ColorVariantPicker extends StatefulWidget {
  const ColorVariantPicker(this.variantsList, {super.key});

  final List<VariantsModel> variantsList;

  @override
  State<ColorVariantPicker> createState() => _ColorVariantPickerState();
}

class _ColorVariantPickerState extends State<ColorVariantPicker> {
  int selectedItemIndex = 0;

  Widget colorBadge(Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: ShapeDecoration(
        color: color,
        shape: ContinuousRectangleBorder(
          side: BorderSide(width: 1, color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.variantsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedItemIndex = index;
                });
              },
              child: Container(
                padding: .all(1),
                margin: .symmetric(horizontal: 4),
                decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    side: BorderSide(
                      width: 2.4,
                      color: selectedItemIndex == index
                          ? Colours.lightBlue
                          : Colors.transparent,
                      // : Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: colorBadge(
                  Colours.hex(widget.variantsList[index].value!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
