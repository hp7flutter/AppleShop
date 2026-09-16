import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/core/configs/constants/colours.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_model.dart';
import 'package:flutter/material.dart';

class StorageVariantPicker extends StatefulWidget {
  const StorageVariantPicker(this.variantsList, {super.key});

  final List<VariantsModel> variantsList;

  @override
  State<StorageVariantPicker> createState() => _StorageVariantPickerState();
}

class _StorageVariantPickerState extends State<StorageVariantPicker> {
  int selectedItemIndex = 0;

  Widget storageBadge(String storage) {
    return Container(
      width: 72,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        border: .all(width: 1, color: Colors.grey.shade400),
        borderRadius: .circular(8),
      ),
      child: Center(
        child: Components.textFa(storage, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Directionality(
        textDirection: .rtl,
        child: ListView.builder(
          scrollDirection: .horizontal,
          itemCount: widget.variantsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedItemIndex = index;
                });
              },
              child: Container(
                padding: .all(2),
                margin: .symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: .circular(10),
                  border: .all(
                    width: 2.2,
                    color: selectedItemIndex == index
                        ? Colours.lightBlue
                        : Colors.transparent,
                  ),
                ),
                child: storageBadge(widget.variantsList[index].value!),
              ),
            );
          },
        ),
      ),
    );
  }
}
