import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchContractRepositories {
  Future<Either<Failuer, ListContractsModel>> searchContract(
      {required String number,
      required String branch,
      required String executingAgency});
}
