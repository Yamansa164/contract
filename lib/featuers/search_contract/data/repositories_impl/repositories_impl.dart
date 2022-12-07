import 'package:contracts/featuers/search_contract/data/datasource/remote_datasource.dart';
import 'package:contracts/featuers/search_contract/data/request/add_statements.dart';
import 'package:contracts/featuers/search_contract/data/request/add_sub_contract.dart';
import 'package:contracts/featuers/search_contract/data/response/statement.dart';
import 'package:contracts/featuers/search_contract/domain/mapper/mapper.dart';
import 'package:dartz/dartz.dart';

import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';

import 'package:contracts/core/error/failuer.dart';

import '../../../../core/error/execption.dart';
import '../../domain/entities/list_statements_model.dart';
import '../../domain/repostitories/repositories.dart';
import '../response/contract_response.dart';

class ContractRepositoriesImpl extends ContractRepositories {
  final ContractRemoteDatasource contractRemoteDatesource;
  ContractRepositoriesImpl({
    required this.contractRemoteDatesource,
  });

  //////// search contract
  @override
  Future<Either<Failuer, ListContractsModel>> searchContract(
      {required String number,
      required String branch,
      required String executingAgency}) async {
    try {
      final Either<Failuer, ListContractResponse> addSuccess =
          await contractRemoteDatesource.searchContract(
              number: number, branch: branch, executingAgency: executingAgency);

      return addSuccess.fold((faliuer) {
        return Left(faliuer);
      }, (listContractsResponse) {
        return right(listContractsResponse.toModel());
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  ////////////////// add statements

  @override
  Future<Either<Failuer, bool>> addStatement(
      {required AddStatementRequest addStatementRequest,
      required int contractId}) async {
    try {
      final Either<Failuer, bool> addSuccess =
          await contractRemoteDatesource.addStatement(
              addStatementRequest: addStatementRequest, contractId: contractId);

      return addSuccess.fold((faliuer) {
        return Left(faliuer);
      }, (bool) {
        return right(bool);
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  //// get statments

  @override
  Future<Either<Failuer, ListStatementModel>> getStatements(
      {required int contractId}) async {
    try {
      final Either<Failuer, ListStatementsResponse> addSuccess =
          await contractRemoteDatesource.getStatements(contractId: contractId);

      return addSuccess.fold((faliuer) {
        return Left(faliuer);
      }, (statements) {
        return right(statements.toModel());
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  ////////// add sub contract

  @override
  Future<Either<Failuer, bool>> addSubContract(
      {required AddSubContractRequest addSubContractRequest,
      required int contractId}) async {
    try {
      final Either<Failuer, bool> addSuccess =
          await contractRemoteDatesource.addSubContract(
              addSubContractRequest: addSubContractRequest, contractId: contractId);
 print('trs');
      return addSuccess.fold((faliuer) {
        return Left(faliuer);
      }, (bool) {
        return right(bool);
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
