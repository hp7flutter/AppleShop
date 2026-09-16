class VariantsTypeModel {
  String? id;
  String? name;
  String? title;
  VariantsTypeEnum? type;

  VariantsTypeModel(this.id, this.name, this.title, this.type);

  factory VariantsTypeModel.fromJson(Map<String, dynamic> json) {
    return VariantsTypeModel(
      json['id'],
      json['name'],
      json['title'],
      getVariantsTypeEnum(json['type']),
    );
  }
}

VariantsTypeEnum getVariantsTypeEnum(String type) {
  switch (type) {
    case "Color":
      return VariantsTypeEnum.COLOR;
    case "Storage":
      return VariantsTypeEnum.STORAGE;
    case "Voltage":
      return VariantsTypeEnum.VOLTAGE;
  }
  return VariantsTypeEnum.DEFAULT;
}

enum VariantsTypeEnum { COLOR, STORAGE, VOLTAGE, DEFAULT }
