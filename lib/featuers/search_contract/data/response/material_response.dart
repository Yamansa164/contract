class MaterialsResponse {
  MaterialsResponse({
    required this.id,
    required this.number,
    required this.materialName,
    required this.contractId,
    required this.individualPrice,
    required this.overallPrice,
    required this.quantity,
    required this.unit,
  });
  late final int id;
  late final int number;
  late final String materialName;
  late final int contractId;
  late final double individualPrice;
  late final int overallPrice;
  late final int quantity;
  late final String unit;
  
  MaterialsResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    number = json['number'];
    materialName = json['material_name'];
    contractId = json['contract_id'];
    individualPrice = json['individual_price'];
    overallPrice = json['overall_price'];
    quantity = json['quantity'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['number'] = number;
    _data['material_name'] = materialName;
    _data['contract_id'] = contractId;
    _data['individual_price'] = individualPrice;
    _data['overall_price'] = overallPrice;
    _data['quantity'] = quantity;
    _data['unit'] = unit;
    return _data;
  }
}