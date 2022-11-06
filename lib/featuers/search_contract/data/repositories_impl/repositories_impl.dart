import 'package:contracts/featuers/search_contract/data/datasource/remote_datasource.dart';
import 'package:contracts/featuers/search_contract/data/response/list_contracts_response.dart';
import 'package:contracts/featuers/search_contract/domain/mapper/mapper.dart';
import 'package:dartz/dartz.dart';

import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';

import 'package:contracts/core/error/failuer.dart';

import '../../../../core/error/execption.dart';
import '../../domain/repostitories/repositories.dart';

class SearchContractRepositoriesImpl extends SearchContractRepositories {
  SearchContractRemoteDatasource searchContractRemoteDatesource;
  SearchContractRepositoriesImpl(
      {required this.searchContractRemoteDatesource, });
  @override
  Future<Either<Failuer, ListContractsModel>> searchContract(
      {required String number,
      required String branch,
      required String executingAgency}) async {
    try {
      final Either<Failuer, ListContractsResponse> addSuccess =
          await searchContractRemoteDatesource.searchContract(
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
}
