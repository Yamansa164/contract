import 'package:contracts/core/error/execption.dart';
import 'package:contracts/core/network/network.dart';
import 'package:contracts/featuers/add_contract/data/datasource/remote_data_source.dart';
import 'package:contracts/featuers/add_contract/data/request/add_contract_request.dart';
import 'package:contracts/featuers/add_contract/data/response/contract_response.dart';
import 'package:dartz/dartz.dart';

import 'package:contracts/featuers/add_contract/domain/usecase/add_contract_usecase.dart';

import 'package:contracts/featuers/add_contract/domain/entities/contract_material.dart';

import 'package:contracts/core/error/failuer.dart';

import '../../domain/repostitories/repositories.dart';

class AddContractRepositoriesImpl extends AddContractRepositories {
  // final NetworkInfo networkInfo;
  final AddContractRemoteDataSource remoteDataSource;
  AddContractRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<Failuer, bool>> addContract(
      {required AddContractRequest addContractRequest}) async {
    // if (await networkInfo.isConnected) {
    try {      final Either<Failuer, bool> addSuccess =
          await remoteDataSource.addContract(addContractRequest);
          
     return addSuccess.fold((faliuer) {
        return Left(faliuer);
      }, (b) {
        return right(b);
      });
      
    
    } on ServerException {
      return Left(ServerFailure());
    }
    // } else {
    // return left(NoInternetFailure());
    // }
  }
}
