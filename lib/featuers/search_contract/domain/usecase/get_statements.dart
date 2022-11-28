import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/core/usecase/usecase.dart';
import 'package:contracts/featuers/search_contract/data/request/add_statements.dart';
import 'package:contracts/featuers/search_contract/data/response/statement.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_statements_model.dart';
import 'package:dartz/dartz.dart';

import '../repostitories/repositories.dart';

class GetStatementsUseCase extends UseCase<int, ListStatementModel> {
  ContractRepositories repositories;
  GetStatementsUseCase({required this.repositories});
  @override
  Future<Either<Failuer, ListStatementModel>> excute({required int input}) {
    return repositories.getStatements(contractId: input);
  }
}
