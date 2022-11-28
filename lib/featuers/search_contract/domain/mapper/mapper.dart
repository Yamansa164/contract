import 'package:contracts/featuers/search_contract/data/response/list_contracts_response.dart';
import 'package:contracts/featuers/search_contract/data/response/material_response.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';

import '../../data/response/contract_response.dart';

extension MaterialModelMapper on MaterialsResponse? {
  MaterialModel toModel() {
    return MaterialModel(
        id: this!.id,
        number: this!.number,
        name: this!.materialName,
        amount: this!.quantity,
        unit: this!.unit,
        individualPrice: this!.individualPrice);
  }
}

extension ContractsModelMapper on ContractResponse? {
  ContractsModel toModel() {
    return ContractsModel(
      id: this!.id,
      branch: this!.branch,
      contractNum: this!.number,
      executingAgency: this!.executingAgency,
      starteDate: this!.startingDate,
      listMaterial: this!.materials.map((e) => e.toModel()).toList(),
    );
  }
}

extension ListContractsModelMapper on ListContractsResponse? {
  ListContractsModel toModel() {
    return ListContractsModel(
        contract: this!.data.map((e) => e.toModel()).toList());
  }
}
