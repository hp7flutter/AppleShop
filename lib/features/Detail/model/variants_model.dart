class VariantsModel {
  String? id;
  String? name;
  String? productId;
  String? typeId;
  String? value;
  int? priceChange;

  VariantsModel(
    this.id,
    this.name,
    this.productId,
    this.typeId,
    this.value,
    this.priceChange,
  );

  factory VariantsModel.fromJson(Map<String, dynamic> json) {
    return VariantsModel(
      json['id'],
      json['name'],
      json['product_id'],
      json['type_id'],
      json['value'],
      json['price_change'],
    );
  }
}
