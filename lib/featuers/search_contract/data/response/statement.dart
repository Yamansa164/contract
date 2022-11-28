class ListStatementsResponse {
  List<StatmentResponse>? data;

  ListStatementsResponse({this.data});

  ListStatementsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StatmentResponse>[];
      json['data'].forEach((v) {
        data!.add(StatmentResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatmentResponse {
  late int id;
  late int contractId;
  late String date;
  late int overallPrice;
  late int newPrice;
  late int discount;
  late int executingAgencyPrice;
  late int discountOfExecutingAgencyPrice;
  late int executingAgencyPriceAfterDiscount;
  
 late List<StatementMaterialsResponse> materials;

  StatmentResponse(
      {required this.id,
      required this.contractId,
      required this.date,
      required this.overallPrice,
      required this.newPrice,
      required this.discount,
      required this.executingAgencyPrice,
      required this.discountOfExecutingAgencyPrice,
      required this.executingAgencyPriceAfterDiscount,
      
      required this.materials});

  StatmentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractId = json['contract_id'];
    date = json['date'];
    overallPrice = json['overall_price'];
    newPrice = json['new_price'];
    discount = json['discount'];
    executingAgencyPrice = json['executing_agency_price'];
    discountOfExecutingAgencyPrice = json['discount_of_executing_agency_price'];
    executingAgencyPriceAfterDiscount =
        json['executing_agency_price_after_discount'];

    if (json['materials'] != null) {
      materials = <StatementMaterialsResponse>[];
      json['materials'].forEach((v) {
        materials.add(new StatementMaterialsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['contract_id'] = contractId;
    data['date'] = date;
    data['overall_price'] = overallPrice;
    data['new_price'] = newPrice;
    data['discount'] = discount;
    data['executing_agency_price'] = executingAgencyPrice;
    data['discount_of_executing_agency_price'] = discountOfExecutingAgencyPrice;
    data['executing_agency_price_after_discount'] =
        executingAgencyPriceAfterDiscount;
    data['materials'] = materials.map((v) => v.toJson()).toList();
    return data;
  }
}

class StatementMaterialsResponse {
 late  int id;
 late int materialId;
 late int billId;
 late int quantity;
 late int price;

  StatementMaterialsResponse(
      {required this.id, required this.materialId, required this.billId, required this.quantity, required this.price});

  StatementMaterialsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialId = json['material_id'];
    billId = json['bill_id'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['material_id'] = materialId;
    data['bill_id'] = billId;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
