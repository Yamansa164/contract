import 'dart:convert';
import 'dart:math';

import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/featuers/add_contract/data/request/add_contract_request.dart';
import 'package:contracts/featuers/add_contract/domain/entities/contract.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../../core/error/execption.dart';
import '../response/contract_response.dart';

String url = 'http://127.0.0.1:8000/api/contracts/';

abstract class RemoteDataSource {
  Future<Either<Failuer, bool>> addContract(
      AddContractRequest addContractRequest);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<Either<Failuer, bool>> addContract(
      AddContractRequest addContractRequest) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final Map<String, dynamic> body = addContractRequest.toJson();

    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(body));
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.body);
        return Right(true);
      } else {
        print('ferror');
        final body = jsonDecode(response.body);

        // List<dynamic> errors = body['errors'];

    
        return Left(Failuer(message: "body['error']"));
      }
    } catch(e) {
      return Left(ServerFailure());
    }
  }
}
