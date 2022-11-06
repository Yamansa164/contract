import 'package:contracts/core/error/failuer.dart';

import 'package:dartz/dartz.dart';

import '../../data/request/add_contract_request.dart';
import '../entities/contract_material.dart';

abstract class AddContractRepositories {
  Future<Either<Failuer, bool>>  addContract(
      {required AddContractRequest addContractRequest });

}
