import 'package:apple_shop_ir/common/components/components.dart';
import 'package:apple_shop_ir/features/Detail/model/product_variants_model.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_type_model.dart';
import 'package:apple_shop_ir/presentation/screens/detail/widgets/color_variant_picker.dart';
import 'package:apple_shop_ir/presentation/screens/detail/widgets/storage_variant_picker.dart';
import 'package:flutter/material.dart';

class VariantGenerator extends StatelessWidget {
  const new(this.productVariants, {super.key});

  final ProductVariantsModel productVariants;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .end,
      spacing: 12,
      children: [
        SizedBox(height: 32),
        Text(productVariants.variantsType.title!),
        if (productVariants.variantsType.type == VariantsTypeEnum.COLOR) ...{
          ColorVariantPicker(productVariants.variantsList),
        },
        if (productVariants.variantsType.type == VariantsTypeEnum.STORAGE) ...{
          StorageVariantPicker(productVariants.variantsList),
        },
        if (productVariants.variantsType.title == VariantsTypeEnum.VOLTAGE) ...{
          Components.textFa('ولتاژ:'),
        },
        if (productVariants.variantsType.title == VariantsTypeEnum.DEFAULT) ...{
          Components.textFa('مشخصات:'),
        },
      ],
    );
  }
}
