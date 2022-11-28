class AddContractRequest {
  final String name;
  final String executingAgency;
  final String watchingAgency;
  final String date;
  final String startingDate;
  final String finishingDate;
  final String executionPeriod;
  final int upPercent;
  final int downPercent;
  final String number;
  final String branch;
  final String content;
  final double price;
  final double upPrice;
  final List<ContractMaterialsRequest> materials;

  AddContractRequest(
      {required this.name,
      required this.executingAgency,
      required this.watchingAgency,
      required this.date,
      required this.startingDate,
      required this.finishingDate,
      required this.executionPeriod,
      required this.upPercent,
      required this.downPercent,
      required this.number,
      required this.branch,
      required this.content,
      required this.price,
      required this.upPrice,
      required this.materials});

  factory AddContractRequest.fromJson(Map<String, dynamic> json) {
    return AddContractRequest(
        name: json['name'],
        executingAgency: json['executing_agency'],
        watchingAgency: json['watching_agency'],
        date: json['date'],
        startingDate: json['starting_date'],
        finishingDate: json['finishing_date'],
        executionPeriod: json['execution_period'],
        upPercent: json['up_percent'],
        downPercent: json['down_percent'],
        number: json['number'],
        branch: json['branch'],
        content: json['content'],
        price: json['price'],
        upPrice: json['up_price'],
        materials: List.from(json['materials'])
            .map((e) => ContractMaterialsRequest.fromJson(e))
            .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['executing_agency'] = executingAgency;
    data['watching_agency'] = watchingAgency;
    data['date'] = date;
    data['starting_date'] = startingDate;
    data['finishing_date'] = finishingDate;
    data['execution_period'] = executionPeriod;
    data['up_percent'] = upPercent;
    data['down_percent'] = downPercent;
    data['number'] = number;
    data['branch'] = branch;
    data['content'] = content;
    data['price'] = price;
    data['up_price'] = upPrice;
    data['materials'] = materials.map((v) => v.toJson()).toList();

    return data;
  }
}

class ContractMaterialsRequest {
  final String materialName;
  final String unit;
  final int quantity;
  final double individualPrice;
  final double overallPrice;
  final  String number;

  ContractMaterialsRequest(
      {required this.materialName,
      required this.unit,
      required this.quantity,
      required this.individualPrice,
      required this.overallPrice,
      required this.number});

  factory ContractMaterialsRequest.fromJson(Map<String, dynamic> json) {
    return ContractMaterialsRequest(
        materialName: json['material_name'],
        unit: json['unit'],
        quantity: json['quantity'],
        individualPrice: json['individual_price'],
        overallPrice: json['overall_price'],
        number: json['number']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['material_name'] = this.materialName;
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    data['individual_price'] = this.individualPrice;
    data['overall_price'] = this.overallPrice;
    data['number'] = this.number;
    return data;
  }
}
