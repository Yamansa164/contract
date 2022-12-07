import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/core/usecase/usecase.dart';
import 'package:contracts/featuers/search_contract/data/request/add_sub_contract.dart';
import 'package:dartz/dartz.dart';

import '../repostitories/repositories.dart';

class AddSubContractUseCase extends UseCase<AddSubContractInput, bool> {
 final ContractRepositories repositories;
  AddSubContractUseCase({required this.repositories});
  @override
  Future<Either<Failuer, bool>> excute({required AddSubContractInput input}) {
    return repositories.addSubContract(
        addSubContractRequest: input.addSubContractRequest,
        contractId: input.contractId);
  }
}

class AddSubContractInput {
  final AddSubContractRequest addSubContractRequest;
  final int contractId;

  AddSubContractInput(
      {required this.addSubContractRequest, required this.contractId});
}
