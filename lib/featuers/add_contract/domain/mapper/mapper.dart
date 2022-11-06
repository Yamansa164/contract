import 'package:contracts/featuers/add_contract/data/request/add_contract_request.dart';
import 'package:contracts/featuers/add_contract/data/response/contract_material_response.dart';
import 'package:contracts/featuers/add_contract/domain/entities/contract_material.dart';

extension ContractMaterialToRequest on AddContractMaterialModel? {
  ContractMaterialsRequest toRequest() {
    return ContractMaterialsRequest(
        number: this!.num,
        materialName: this!.name,
        unit: this!.unit,
        quantity: this!.amount,
        individualPrice: this!.individualPrice,
        overallPrice: this!.overallPrice);
  }
}
