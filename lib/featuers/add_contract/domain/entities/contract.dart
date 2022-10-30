import 'package:contracts/featuers/add_contract/domain/entities/contract_material.dart';

class ContractModel {
  final String name;
  final String date;
  final String branch;
  final String content;
  final double upPercent;
  final String downPercent;
  final String number;
  final String price;
  final String upPrice;
  final String startingOrderDate;
  final String finishingStartDate;
  final String executionPeriod;
  final String executionAgency;
  final String watchingAgencu; 
  final List<ContractMaterialModel> material;
  ContractModel( {required this.material,
      required this.name,
      required this.date,
      required this.branch,
      required this.content,
      required this.upPercent,
      required this.downPercent,
      required this.number,
      required this.price,
      required this.upPrice,
      required this.startingOrderDate,
      required this.finishingStartDate,
      required this.executionPeriod,
      required this.executionAgency,
      required this.watchingAgencu});
}
