class ContractMaterialsResponse {
  ContractMaterialsResponse({
    required this.num,
    required this.materialName,
    required this.unit,
    required this.quantity,
    required this.individualPrice,
    required this.overallPrice,
  });
  late final int num;
  late final String materialName;
  late final String unit;
  late final int quantity;
  late final double individualPrice;
  late final double overallPrice;

  ContractMaterialsResponse.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    materialName = json['material_name'];
    unit = json['unit'];
    quantity = json['quantity'];
    individualPrice = json['individual_price'];
    overallPrice = json['overall_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['num'] = num;
    _data['material_name'] = materialName;
    _data['unit'] = unit;
    _data['quantity'] = quantity;
    _data['individual_price'] = individualPrice;
    _data['overall_price'] = overallPrice;
    return _data;
  }
}
