class AddSubContractRequest {
  final String startingDate;
  final String agreementDate;
  final String agreementNumber;
  final String number;
  final String subject;
  final List<ContractMaterialsRequestToSubContract> contractMaterials;
  final List<OtherMaterialsRequestToSubContract> otherMaterials;

  AddSubContractRequest(
      {required this.startingDate,
      required this.agreementDate,
      required this.agreementNumber,
      required this.number,
      required this.subject,
      required this.contractMaterials,
      required this.otherMaterials});

  factory AddSubContractRequest.fromJson(Map<String, dynamic> json) {
    return AddSubContractRequest(
        startingDate: json['starting_date'],
        agreementDate: json['agreement_date '],
        agreementNumber: json['agreement_number '],
        number: json['number '],
        subject: json[' subject'],
        contractMaterials: List.from(json['contract_materials'])
            .map((e) => ContractMaterialsRequestToSubContract.fromJson(e))
            .toList(),
        otherMaterials: List.from(json['other_materials'])
            .map((e) => OtherMaterialsRequestToSubContract.fromJson(e))
            .toList());
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['starting_date'] = startingDate;
    data['agreement_date'] = agreementDate;
    data['agreement_number'] = agreementNumber;
    data['number'] = number;
    data['subject'] = subject;
    data['contract_materials'] =
        contractMaterials.map((v) => v.toJson()).toList();
    data['other_materials'] = otherMaterials.map((v) => v.toJson()).toList();
    return data;
  }
}

class ContractMaterialsRequestToSubContract {
  final String materialId;
  final int quantity;

  ContractMaterialsRequestToSubContract(
      {required this.materialId, required this.quantity});

  factory ContractMaterialsRequestToSubContract.fromJson(
      Map<String, dynamic> json) {
    return ContractMaterialsRequestToSubContract(
        materialId: json['id'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = materialId;
    data['quantity'] = quantity;
    return data;
  }
}

class OtherMaterialsRequestToSubContract {
  final String materialName;
  final int quantity;
  final String unit;
  final String number;
  final int individualPrice;
  final int overallPrice;

  OtherMaterialsRequestToSubContract(
      {required this.unit,
      required this.materialName,
      required this.quantity,
      required this.number,
      required this.individualPrice,
      required this.overallPrice});

  factory OtherMaterialsRequestToSubContract.fromJson(
      Map<String, dynamic> json) {
    return OtherMaterialsRequestToSubContract(
        materialName: json['material_name'],
        quantity: json['quantity'],
        number: json['number'],
        individualPrice: json['individual_price'],
        overallPrice: json['overall_price'],
        unit: json['unit']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['material_name'] = materialName;
    data['quantity'] = quantity;
    data['number'] = number;
    data['individual_price'] = individualPrice;
    data['overall_price'] = overallPrice;
    return data;
  }
}
