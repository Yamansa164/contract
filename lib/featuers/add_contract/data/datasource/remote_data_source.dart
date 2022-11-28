import 'dart:convert';
import 'dart:math';

import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/core/resources/const.dart';
import 'package:contracts/featuers/add_contract/data/request/add_contract_request.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;




abstract class AddContractRemoteDataSource {
  Future<Either<Failuer, bool>> addContract(
      AddContractRequest addContractRequest);
}

class AddContractRemoteDataSourceImpl extends AddContractRemoteDataSource {
  @override
  Future<Either<Failuer, bool>> addContract(
      AddContractRequest addContractRequest) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final Map<String, dynamic> body = addContractRequest.toJson();

    try {
      final http.Response response = await http.post(Uri.parse('${ConstManage.url}/contracts/'),
          headers: headers, body: jsonEncode(body));
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        final body = jsonDecode(response.body);

        // List<dynamic> errors = body['errors'];

  
        return Left(Failuer(message: body['error']));
      }
    } catch(e) {
      return Left(ServerFailure());
    }
  }
}
