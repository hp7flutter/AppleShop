import 'package:apple_shop_ir/features/Detail/model/variants_model.dart';
import 'package:apple_shop_ir/features/Detail/model/variants_type_model.dart';

class ProductVariantsModel {
  VariantsTypeModel variantsType;
  List<VariantsModel> variantsList;

  ProductVariantsModel(this.variantsType, this.variantsList);
}
