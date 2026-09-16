import 'package:apple_shop_ir/features/Detail/model/product_variants_model.dart';
import 'package:apple_shop_ir/presentation/screens/detail/widgets/variant_generator.dart';
import 'package:flutter/material.dart';

class VariantBuilder extends StatelessWidget {
  const new(this.productVariantList, {super.key});
  final List<ProductVariantsModel> productVariantList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var productVaraint in productVariantList) ...{
          if (productVaraint.variantsList.isNotEmpty) ...{
            VariantGenerator(productVaraint),
          },
        },
      ],
    );
  }
}
