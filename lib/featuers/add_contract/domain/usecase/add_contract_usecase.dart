import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/core/usecase/usecase.dart';

import 'package:contracts/featuers/add_contract/domain/repostitories/repositories.dart';
import 'package:dartz/dartz.dart';

import '../../data/request/add_contract_request.dart';

class AddContractUseCase extends UseCase<AddContractRequest , bool> {
  final Repositories repositories;
  AddContractUseCase({required this.repositories});

  @override
  Future<Either<Failuer, bool>> excute({required AddContractRequest  input}) {

    return repositories.addContract(addContractRequest: input);
  }
}

