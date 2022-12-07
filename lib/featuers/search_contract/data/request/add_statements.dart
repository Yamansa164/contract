class AddStatementRequest {
  final String date;
  final String discount;
  final List<StatementMaterialsRequest> materials;

  AddStatementRequest(
      {required this.date, required this.materials, required this.discount});

  factory AddStatementRequest.fromJson(Map<String, dynamic> json) {
    return (AddStatementRequest(
        date: json['date'],
        discount: json['discount'],
        materials: List.from(json['materials'])
            .map((e) => StatementMaterialsRequest.fromJson(e))
            .toList()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['discount'] = discount;
    data['materials'] = materials.map((material) => material.toJson()).toList();
    return data;
  }
}

class StatementMaterialsRequest {
  int materialId;
  int quantity;

  StatementMaterialsRequest({required this.materialId, required this.quantity});

  factory StatementMaterialsRequest.fromJson(Map<String, dynamic> json) {
    return (StatementMaterialsRequest(
        materialId: json['material_id'], quantity: json['quantity']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['material_id'] = materialId;
    data['quantity'] = quantity;
    return data;
  }
}
