import 'package:contracts/featuers/search_contract/data/response/statement.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_statements_model.dart';

import '../../data/response/contract_response.dart';

extension MaterialModelMapper on MaterialsResponse? {
  MaterialModel toModel() {
    return MaterialModel(
        id: this!.id,
        number: this!.number,
        name: this!.materialName.toString(),
        unit: this!.unit.toString(),
        quantity: int.parse(this!.quantity),
        notUsedQuantity: (this!.notUsedQuantity),
        individualPrice: this!.price,
        subContractNumber: this!.subContractNumber);
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

extension ListContractsModelMapper on ListContractResponse? {
  ListContractsModel toModel() {
    return ListContractsModel(
        contract: this!.data!.map((e) => e.toModel()).toList());
  }
}

extension StatementModelMapper on StatmentResponse? {
  StatementModel toModel() {
    return StatementModel(
        id: this!.id,
        date: this!.date,
        overallPrice: this!.price,
        newPrice: this!.newPrice,
        discount: this!.discount,
        executingAgencyPrice: this!.executingAgencyPrice,
        discountOfExecutingAgencyPrice: this!.discountOfExecutingAgencyPrice,
        executingAgencyPriceAfterDiscount:
            this!.executingAgencyPriceAfterDiscount);
  }
}

extension ListStatementModelMapper on ListStatementsResponse? {
  ListStatementModel toModel() {
    return ListStatementModel(
        listStatement: this!.data!.map((e) => e.toModel()).toList());
  }
}
