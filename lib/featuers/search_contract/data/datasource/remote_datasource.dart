import 'dart:convert';

import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/featuers/search_contract/data/response/list_contracts_response.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/const.dart';

abstract class SearchContractRemoteDatasource {
  Future<Either<Failuer, ListContractsResponse>> searchContract(
      {required String number,
      required String branch,
      required String executingAgency});
}

class SearchContractRemoteDataSourceImpl
    extends SearchContractRemoteDatasource {
  @override
  Future<Either<Failuer, ListContractsResponse>> searchContract(
      {required String number,
      required String branch,
      required String executingAgency}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final Map<String, dynamic> body = {
      "executing_agency": executingAgency,
      "number": number,
      "branch": branch
    };

    try {
      final http.Response response = await http.post(
          Uri.parse('${ConstManage.url}/contracts/search'),
          headers: headers,
          body: jsonEncode(body));
      
      if (response.statusCode == 200) {
    
        return Right(ListContractsResponse.fromJson(jsonDecode(response.body)));
      } else {
       
        final body = jsonDecode(response.body);
       

        return Left(Failuer(message: body['error']));
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
