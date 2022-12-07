import 'dart:convert';

import 'package:contracts/core/error/failuer.dart';
import 'package:contracts/featuers/search_contract/data/request/add_statements.dart';
import 'package:contracts/featuers/search_contract/data/request/add_sub_contract.dart';
import 'package:contracts/featuers/search_contract/data/response/statement.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/const.dart';
import '../response/contract_response.dart';

abstract class ContractRemoteDatasource {
  Future<Either<Failuer, ListContractResponse>> searchContract(
      {required String number,
      required String branch,
      required String executingAgency});
  Future<Either<Failuer, bool>> addStatement({
    required AddStatementRequest addStatementRequest,
    required int contractId,
  });
  Future<Either<Failuer, ListStatementsResponse>> getStatements(
      {required int contractId});
  Future<Either<Failuer, bool>> addSubContract({
    required AddSubContractRequest addSubContractRequest,
    required int contractId,
  });
}

class ContractRemoteDataSourceImpl extends ContractRemoteDatasource {
  @override
  Future<Either<Failuer, ListContractResponse>> searchContract(
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
      print(response.statusCode);

      if (response.statusCode == 200) {
        return Right(ListContractResponse.fromJson(jsonDecode(response.body)));
      } else {
        final body = jsonDecode(response.body);
        print(body['error']);

        return Left(Failuer(message: body['error']));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }
/////
  ////// add statements

  @override
  Future<Either<Failuer, bool>> addStatement(
      {required AddStatementRequest addStatementRequest,
      required int contractId}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final Map<String, dynamic> body = addStatementRequest.toJson();

    try {
      final http.Response response = await http.post(
          Uri.parse('${ConstManage.url}/contracts/$contractId/bills/'),
          headers: headers,
          body: jsonEncode(body));

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        final body = jsonDecode(response.body);

        return Left(Failuer(message: body['error']));
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

////
  /// get statements
  @override
  Future<Either<Failuer, ListStatementsResponse>> getStatements(
      {required int contractId}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final http.Response response = await http.get(
        Uri.parse('${ConstManage.url}/contracts/$contractId/bills/'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print(id);
        print(jsonDecode(response.body));
        print('sss');
        return Right(
            ListStatementsResponse.fromJson(jsonDecode(response.body)));
      } else {
        final body = jsonDecode(response.body);
        print('eee');
        print(body);
        return Left(Failuer(message: body['error']));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  //////
  //////// add sub contract

  @override
  Future<Either<Failuer, bool>> addSubContract(
      {required AddSubContractRequest addSubContractRequest,
      required int contractId}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final Map<String, dynamic> body = addSubContractRequest.toJson();

    try {
      final http.Response response = await http.post(
          Uri.parse('${ConstManage.url}/contracts/$contractId/subs/'),
          headers: headers,
          body: jsonEncode(body));
          print(contractId);
      print(response.body);
      print(jsonEncode(body));
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        final body = jsonDecode(response.body);

        return Left(Failuer(message: body['error']));
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
