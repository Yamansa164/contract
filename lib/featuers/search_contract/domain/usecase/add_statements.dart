import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/core/usecase/usecase.dart';
import 'package:contracts/featuers/search_contract/data/request/add_statements.dart';
import 'package:dartz/dartz.dart';

import '../repostitories/repositories.dart';

class AddStatementsUseCase extends UseCase<AddStatementInput, bool> {
  ContractRepositories repositories;
  AddStatementsUseCase({required this.repositories});
  @override
  Future<Either<Failuer, bool>> excute({required AddStatementInput input}) {
    return repositories.addStatement(
        addStatementRequest: input.addStatementRequest,
        contractId: input.contractId);
  }
}

class AddStatementInput {
  final AddStatementRequest addStatementRequest;
  final int contractId;

  AddStatementInput(
      {required this.contractId, required this.addStatementRequest});
}
