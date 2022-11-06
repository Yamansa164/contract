import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/core/usecase/usecase.dart';
import 'package:contracts/featuers/search_contract/domain/entities/list_contract_model.dart';
import 'package:contracts/featuers/search_contract/domain/repostitories/repositories.dart';
import 'package:contracts/featuers/search_contract/presntiation/widget/search_container.dart';
import 'package:dartz/dartz.dart';

class SearchContractUseCase extends UseCase<SearchInput, ListContractsModel> {
  SearchContractRepositories repositories;
  SearchContractUseCase({required this.repositories});
  @override
  Future<Either<Failuer, ListContractsModel>> excute(
      {required SearchInput input}) {
    return repositories.searchContract(
        number: input.number,
        branch: input.branch,
        executingAgency: input.executingAgency);
  }
}

class SearchInput {
  final String number;
  final String branch;
  final String executingAgency;

  SearchInput(
      {required this.number,
      required this.branch,
      required this.executingAgency});
}
