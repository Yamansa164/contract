class ListContractResponse {
  List<ContractResponse>? data;

  ListContractResponse({this.data});

  ListContractResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ContractResponse>[];
      json['data'].forEach((v) {
        data!.add(ContractResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContractResponse {
  late int id;
  late String projectName;
  late String areaName;
  late String date;
  late String branch;
  late int upPercent;
  late int downPercent;
  late int stoppingsPercent;
  late String number;
  late double price;
  late double upPrice;
  late String startingDate;
  late String virtualFinishingDate;
  late String executionPeriod;
  late String executingAgency;
  late String watchingAgency;
  late List<MaterialsResponse> materials;

  ContractResponse(
      {required this.id,
      required this.projectName,
      required this.areaName,
      required this.date,
      required this.branch,
      required this.upPercent,
      required this.downPercent,
      required this.stoppingsPercent,
      required this.number,
      required this.price,
      required this.upPrice,
      required this.startingDate,
      required this.virtualFinishingDate,
      required this.executionPeriod,
      required this.executingAgency,
      required this.watchingAgency,
      required this.materials});

  ContractResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
    areaName = json['area_name'];
    date = json['date'];
    branch = json['branch'];
    upPercent = json['up_percent'];
    downPercent = json['down_percent'];
    stoppingsPercent = json['stoppings_percent'];
    number = json['number'];
    price = json['price'];
    upPrice = json['up_price'];
    startingDate = json['starting_date'];
    virtualFinishingDate = json['virtual_finishing_date'];
    executionPeriod = json['execution_period'];
    executingAgency = json['executing_agency'];
    watchingAgency = json['watching_agency'];
    if (json['materials'] != null) {
      materials = <MaterialsResponse>[];
      json['materials'].forEach((v) {
        materials.add(MaterialsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_name'] = projectName;
    data['area_name'] = areaName;
    data['date'] = date;
    data['branch'] = branch;
    data['up_percent'] = upPercent;
    data['down_percent'] = downPercent;
    data['stoppings_percent'] = stoppingsPercent;
    data['number'] = number;
    data['price'] = price;
    data['up_price'] = upPrice;
    data['starting_date'] = startingDate;
    data['virtual_finishing_date'] = virtualFinishingDate;
    data['execution_period'] = executionPeriod;
    data['executing_agency'] = executingAgency;
    data['watching_agency'] = watchingAgency;
    data['materials'] = materials.map((v) => v.toJson()).toList();
    return data;
  }
}

class MaterialsResponse {
  late int id;
  late String number;
  late String materialName;
  late String unit;
  late double price;
  late String quantity;
  late String notUsedQuantity;
  late String subContractNumber;

  MaterialsResponse(
      {required this.id,
      required this.number,
      required this.materialName,
      required this.unit,
      required this.price,
      required this.quantity,
      required this.notUsedQuantity,
      required this.subContractNumber});

  MaterialsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    materialName = json['material_name'];
    unit = json['unit'];
    price = json['price'];
    quantity = json['quantity'];
    notUsedQuantity = json['not_used_quantity'];
    subContractNumber = json['sub_contract_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['material_name'] = materialName;
    data['unit'] = unit;
    data['price'] = price;
    data['quantity'] = quantity;
    data['not_used_quantity'] = notUsedQuantity;
    data['sub_contract_number'] = subContractNumber;
    return data;
  }
}
