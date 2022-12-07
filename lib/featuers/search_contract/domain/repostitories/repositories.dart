import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/featuers/search_contract/data/request/add_sub_contract.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/request/add_statements.dart';
import '../entities/list_statements_model.dart';

abstract class ContractRepositories {
  Future<Either<Failuer, ListContractsModel>> searchContract(
      {required String number,
      required String branch,
      required String executingAgency});
  Future<Either<Failuer, bool>> addStatement(
      {required AddStatementRequest addStatementRequest,
      required int contractId});
  Future<Either<Failuer, ListStatementModel>> getStatements({required int contractId});
   Future<Either<Failuer, bool>> addSubContract(
      {required AddSubContractRequest addSubContractRequest,
      required int contractId});
}
