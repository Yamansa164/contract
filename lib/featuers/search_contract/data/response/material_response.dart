// class MaterialsResponse {
//   MaterialsResponse({
//     required this.id,
//     required this.number,
//     required this.materialName,
//     required this.contractId,
//     required this.individualPrice,
//     required this.overallPrice,
//     required this.quantity,
//     required this.unit,
//   });
//   late final int id;
//   late final String number;
//   late final String materialName;
//   late final int contractId;
//   late final double individualPrice;
//   late final double overallPrice;
//   late final int quantity;
//   late final String unit;
  
//   MaterialsResponse.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     number = json['number'];
//     materialName = json['material_name'];
//     contractId = json['contract_id'];
//     individualPrice = json['individual_price'];
//     overallPrice = json['overall_price'];
//     quantity = json['quantity'];
//     unit = json['unit'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['number'] = number;
//     data['material_name'] = materialName;
//     data['contract_id'] = contractId;
//     data['individual_price'] = individualPrice;
//     data['overall_price'] = overallPrice;
//     data['quantity'] = quantity;
//     data['unit'] = unit;
//     return data;
//   }
// }